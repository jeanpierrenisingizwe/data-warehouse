import pandas as pd
from sqlalchemy import create_engine, text
from datetime import datetime
import logging

# ---------- CONFIG ----------
DB_USER = "root"
DB_PASS = ""
DB_HOST = "localhost"
DB_NAME = "university_dw"

EXCEL_FILE = "digital_usage.xlsx"
CSV_FILE = "room_bookings.csv"

# ---------- LOGGING ----------
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

# ---------- DB ENGINE ----------
engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASS}@{DB_HOST}/{DB_NAME}")

# ---------- HELPERS ----------
def parse_date(x):
    for fmt in ("%Y-%m-%d", "%m/%d/%Y", "%d-%b-%Y", "%Y-%d-%m", "%b %d, %Y"):
        try:
            return datetime.strptime(str(x), fmt).date()
        except:
            continue
    return None

def normalize_dept(x):
    x = str(x).strip().upper()
    return {"CS":"Computer Science","COMPSCI":"Computer Science"}.get(x, x.title())

def normalize_faculty(x):
    x = str(x).strip().upper()
    return {"ENG":"Engineering","ENGR":"Engineering"}.get(x, x.title())

def normalize_room(x):
    return str(x).replace("Room","").replace("-","").strip().upper()

# ---------- ELT ----------
with engine.begin() as conn:
    logging.info("Loading sources...")

    # Load staging sources
    df_books   = pd.read_sql("SELECT * FROM book_transactions", conn)
    df_digital = pd.read_excel(EXCEL_FILE)
    df_rooms   = pd.read_csv(CSV_FILE)

    logging.info("Cleaning data...")

    # --- BOOKS ---
    df_books["CheckoutDate"] = df_books["CheckoutDate"].apply(parse_date)
    df_books["ReturnDate"]   = df_books["ReturnDate"].apply(parse_date)
    df_books["Department"]   = df_books["Department"].apply(normalize_dept)

    # --- DIGITAL ---
    df_digital["UsageDate"] = df_digital["Date"].apply(parse_date)
    df_digital["Faculty"]   = df_digital["Faculty"].apply(normalize_faculty)
    df_digital["ResourceType"] = df_digital["ResourceType"].str.lower().str.title()
    df_digital["Duration_Minutes"] = df_digital["Duration_Minutes"].fillna(0)

    # Keep only columns that exist in staging table
    df_digital = df_digital[[
        "UsageDate","UserType","ResourceType","Faculty","DownloadCount","Duration_Minutes"
    ]]

    # --- ROOMS ---
    df_rooms["BookingDate"] = df_rooms["BookingDate"].apply(parse_date)
    df_rooms["RoomNumber"]  = df_rooms["RoomNumber"].apply(normalize_room)
    df_rooms = df_rooms.drop_duplicates()

    logging.info("Truncating staging tables...")
    conn.execute(text("TRUNCATE stg_book_transactions"))
    conn.execute(text("TRUNCATE stg_digital_usage"))
    conn.execute(text("TRUNCATE stg_room_bookings"))

    logging.info("Loading into staging...")
    df_books.to_sql("stg_book_transactions", conn, if_exists="append", index=False)
    df_digital.to_sql("stg_digital_usage", conn, if_exists="append", index=False)
    df_rooms.to_sql("stg_room_bookings", conn, if_exists="append", index=False)

    logging.info("Truncating fact and dimension tables (FK-safe)...")
    # Disable FK checks
    conn.execute(text("SET FOREIGN_KEY_CHECKS = 0"))

    # Truncate fact first
    conn.execute(text("TRUNCATE fact_library_usage"))

    # Then truncate dimensions
    conn.execute(text("TRUNCATE dim_student"))
    conn.execute(text("TRUNCATE dim_book"))
    conn.execute(text("TRUNCATE dim_faculty"))
    conn.execute(text("TRUNCATE dim_room"))
    conn.execute(text("TRUNCATE dim_date"))

    # Re-enable FK checks
    conn.execute(text("SET FOREIGN_KEY_CHECKS = 1"))

    logging.info("Loading dimensions...")

    # Students
    conn.execute(text("""
        INSERT INTO dim_student (student_id, department)
        SELECT DISTINCT StudentID, Department FROM stg_book_transactions
    """))

    # Books
    conn.execute(text("""
        INSERT INTO dim_book (book_isbn, category)
        SELECT DISTINCT BookISBN, BookCategory FROM stg_book_transactions
    """))

    # Faculty
    conn.execute(text("""
        INSERT INTO dim_faculty (faculty_name)
        SELECT DISTINCT Faculty FROM stg_digital_usage
    """))

    # Rooms
    conn.execute(text("""
        INSERT INTO dim_room (room_number)
        SELECT DISTINCT RoomNumber FROM stg_room_bookings
    """))

    # Dates
    conn.execute(text("""
        INSERT INTO dim_date (full_date, year, month, day)
        SELECT DISTINCT d, YEAR(d), MONTH(d), DAY(d)
        FROM (
          SELECT CheckoutDate d FROM stg_book_transactions
          UNION
          SELECT UsageDate FROM stg_digital_usage
          UNION
          SELECT BookingDate FROM stg_room_bookings
        ) x
        WHERE d IS NOT NULL
    """))

    logging.info("Loading fact table...")

    # --- BOOK FACTS ---
    conn.execute(text("""
        INSERT INTO fact_library_usage
        (date_key, student_key, book_key, faculty_key, room_key,
         downloads, duration_minutes, booking_hours)
        SELECT
        dd.date_key,
        ds.student_key,
        db.book_key,
        NULL,
        NULL,
        0,
        0,
        0
        FROM stg_book_transactions sbt
        JOIN dim_date dd ON dd.full_date = sbt.CheckoutDate
        JOIN dim_student ds ON ds.student_id = sbt.StudentID
        JOIN dim_book db ON db.book_isbn = sbt.BookISBN
    """))

    # --- DIGITAL FACTS ---
    conn.execute(text("""
        INSERT INTO fact_library_usage
        (date_key, student_key, book_key, faculty_key, room_key,
         downloads, duration_minutes, booking_hours)
        SELECT
        dd.date_key,
        NULL,
        NULL,
        df.faculty_key,
        NULL,
        sdu.DownloadCount,
        sdu.Duration_Minutes,
        0
        FROM stg_digital_usage sdu
        JOIN dim_date dd ON dd.full_date = sdu.UsageDate
        JOIN dim_faculty df ON df.faculty_name = sdu.Faculty
    """))

    # --- ROOM FACTS ---
    conn.execute(text("""
        INSERT INTO fact_library_usage
        (date_key, student_key, book_key, faculty_key, room_key,
         downloads, duration_minutes, booking_hours)
        SELECT
        dd.date_key,
        ds.student_key,
        NULL,
        NULL,
        dr.room_key,
        0,
        0,
        srb.DurationHours
        FROM stg_room_bookings srb
        JOIN dim_date dd ON dd.full_date = srb.BookingDate
        LEFT JOIN dim_student ds ON ds.student_id = srb.StudentID
        JOIN dim_room dr ON dr.room_number = srb.RoomNumber
    """))

logging.info("ELT PIPELINE COMPLETED SUCCESSFULLY")
