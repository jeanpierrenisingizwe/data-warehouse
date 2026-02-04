-- -----------------------------
-- Sample Data for Dim Tables
-- -----------------------------

-- Dim_Date
INSERT IGNORE INTO dim_date (DateKey, Date, Day, Month, Year, Weekday)
SELECT DISTINCT 
    NULL,  -- DateKey will auto-increment if defined
    Date,
    DAY(Date),
    MONTH(Date),
    YEAR(Date),
    DAYNAME(Date)
FROM digital_usage_stg
UNION
SELECT DISTINCT 
    NULL,
    CheckoutDate,
    DAY(CheckoutDate),
    MONTH(CheckoutDate),
    YEAR(CheckoutDate),
    DAYNAME(CheckoutDate)
FROM book_transactions_stg
UNION
SELECT DISTINCT
    NULL,
    BookingDate,
    DAY(BookingDate),
    MONTH(BookingDate),
    YEAR(BookingDate),
    DAYNAME(BookingDate)
FROM room_bookings_stg;

-- Dim_Item
INSERT IGNORE INTO dim_item (ItemID, ItemType, Category, Faculty)
SELECT * FROM (
    SELECT DISTINCT 
        BookISBN AS ItemID,
        'Book' AS ItemType,
        BookCategory AS Category,
        Faculty
    FROM book_transactions_stg
    UNION
    SELECT DISTINCT
        CONCAT(ResourceType, '_', Faculty) AS ItemID,
        'Digital' AS ItemType,
        ResourceType AS Category,
        Faculty
    FROM digital_usage_stg
) AS tmp;

-- Dim_Room
INSERT IGNORE INTO dim_room (RoomNumber)
SELECT DISTINCT RoomNumber
FROM room_bookings_stg;

-- Dim_Student
INSERT IGNORE INTO dim_student (StudentID, Department)
SELECT StudentID, Department
FROM book_transactions_stg
WHERE StudentID IS NOT NULL
UNION
SELECT StudentID, NULL
FROM room_bookings_stg
WHERE StudentID IS NOT NULL;


-- -----------------------------
-- Sample Data for Fact Table
-- -----------------------------
INSERT IGNORE INTO fact_libraryusage 
    (DateKey, StudentKey, ItemKey, RoomKey, DownloadCount, Duration_Minutes, BookingDurationHours)
SELECT
    d.DateKey,
    s.StudentKey,
    i.ItemKey,
    r.RoomKey,
    du.DownloadCount,
    du.Duration_Minutes,
    NULL AS BookingDurationHours
FROM digital_usage_stg du
JOIN dim_date d ON d.Date = du.Date
JOIN dim_student s ON s.StudentID = du.UserType -- adjust if UserType not StudentID
JOIN dim_item i ON i.ItemID = CONCAT(du.ResourceType,'_',du.Faculty)
LEFT JOIN dim_room r ON 1=0; -- digital usage has no room

UNION ALL

SELECT
    d.DateKey,
    s.StudentKey,
    i.ItemKey,
    r.RoomKey,
    NULL AS DownloadCount,
    NULL AS Duration_Minutes,
    rb.DurationHours
FROM room_bookings_stg rb
JOIN dim_date d ON d.Date = rb.BookingDate
JOIN dim_student s ON s.StudentID = rb.StudentID
JOIN dim_room r ON r.RoomNumber = rb.RoomNumber
LEFT JOIN dim_item i ON 1=0; -- room booking has no item

UNION ALL

SELECT
    d.DateKey,
    s.StudentKey,
    i.ItemKey,
    r.RoomKey,
    NULL AS DownloadCount,
    NULL AS Duration_Minutes,
    NULL AS BookingDurationHours
FROM book_transactions_stg bt
JOIN dim_date d ON d.Date = bt.CheckoutDate
JOIN dim_student s ON s.StudentID = bt.StudentID
JOIN dim_item i ON i.ItemID = bt.BookISBN
LEFT JOIN dim_room r ON 1=0; -- book transaction has no room
;
