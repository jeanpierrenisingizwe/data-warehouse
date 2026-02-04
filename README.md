University Library Data Warehouse – Setup & Usage Guide
Overview

This project implements a University Library Data Warehouse using MySQL, ETL processes, and Power BI dashboards.
It integrates and cleans data related to students, books, faculties, rooms, and usage activities to support analytics and decision-making.

The system follows a Snowflake Schema design with dimension and fact tables and supports OLAP operations and interactive dashboards.
 
Prerequisites

Before starting, ensure you have the following installed:

MySQL Server 8.0+

phpMyAdmin or MySQL Workbench

Python 3.8+

Power BI Desktop

Git (optional)

A MySQL user with CREATE / ALTER privileges

Project Structure
university-data-warehouse/
├── 01_Database_Setup/
├── 02_Dimension_Tables/
├── 03_Fact_Tables/
├── 04_Staging_Tables/
├── 05_ETL_Files/
├── 06_PowerBI/
├── README.md

Step 1: Start MySQL Server

Ensure MySQL is running.

Windows (XAMPP):
Start Apache and MySQL from XAMPP Control Panel

Linux / macOS:

sudo service mysql start

 Step 2: Create the Database

Login to MySQL:

mysql -u root -p

Create the database:

CREATE DATABASE university_dw;
USE university_dw;

Step 3: Create Database Users
Read-only User
CREATE USER 'Group8'@'%' IDENTIFIED BY 'DataminingG8';
GRANT SELECT ON university_dw.* TO 'Group8'@'%';
FLUSH PRIVILEGES;

Admin User
CREATE USER 'dw_admin'@'%' IDENTIFIED BY 'DWAdmin@123';
GRANT ALL PRIVILEGES ON university_dw.* TO 'dw_admin'@'%';
FLUSH PRIVILEGES;

Step 4: Create Dimension Tables

Run SQL scripts from:

02_Dimension_Tables/
├── dim_date.sql
├── dim_student.sql
├── dim_faculty.sql
├── dim_book.sql
├── dim_room.sql

Example:

SOURCE 02_Dimension_Tables/dim_date.sql;

Step 5: Create Fact Table
03_Fact_Tables/
├── fact_library_usage.sql

Run:

SOURCE 03_Fact_Tables/fact_library_usage.sql;

Step 6: Create Staging Tables
04_Staging_Tables/
├── staging_students.sql
├── staging_books.sql
├── staging_rooms.sql

Run each:

SOURCE 04_Staging_Tables/staging_students.sql;

 Step 7: Configure ETL Script

Edit:

05_ETL_Files/etl_library_dw.py

Set:

DB_HOST = "localhost"
DB_USER = "dw_admin"
DB_PASSWORD = "DWAdmin@123"
DB_NAME = "university_dw"

Step 8: Run ETL Process

Test connection:

python etl_library_dw.py --test

Run full ETL:

python etl_library_dw.py

This will:
✔ Load raw data into staging
✔ Clean and standardize data
✔ Populate dimension & fact tables

 Step 9: Power BI Dashboard

Open Power BI Desktop

Get Data → MySQL → Connect to university_dw

Load:

fact_library_usage

dim_student, dim_book, dim_faculty, dim_room, dim_date

Create:

Bar chart (Downloads by Faculty)

Line chart (Monthly Trend)

Pie chart (Usage Share)

Slicers (Faculty, Month, Year)

 Step 10: Security & Access Control

Database users have role-based access

Power BI uses Row-Level Security (RLS)

Only authorized users can view/edit dashboards

 Verification
SHOW TABLES;

You should see:

dim_* tables

fact_library_usage

staging_* tables

Troubleshooting
Issue   Solution
Access denied   Check username/password
FK constraint error Update fact table before deleting dimensions
NULL keys   Run cleaning script
Dashboard not refreshing    Check Power BI connection
 Security Notes

Do NOT commit passwords to GitHub

Use environment variables in production

Apply RBAC and RLS policies

 Support

For issues or questions:

University Data Warehouse Team
ICT Department – Data Mining & Warehousing

 License

This project is intended for academic use only.

