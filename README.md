# SQL Server Airline Reservation Database

A hands-on Microsoft SQL Server project demonstrating relational database design, T-SQL development, airline reservation workflows, and business reporting.

## Project Overview

This project models an airline reservation system using SQL Server. It covers airports, flights, passengers, bookings, and passenger tickets.

The objective is to demonstrate practical database development skills through realistic business scenarios and progressively more advanced SQL implementations.

## Technology Stack

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio (SSMS)
- Git and GitHub

## Database Modules

- Airports and flight schedules
- Passenger management
- Booking management
- Passenger ticket and fare management
- Flight occupancy and revenue reporting

## SQL Skills Demonstrated

- Relational database design and normalization
- Primary keys, foreign keys, and constraints
- INNER JOIN and LEFT JOIN
- Aggregations and business reporting
- Common Table Expressions (CTEs) and window functions
- Stored procedures and transaction handling
- Indexing and execution-plan analysis

## Project Structure

```text
sql/
  01_CreateDatabase.sql
  02_CreateTables.sql
  03_InsertSampleData.sql
  04_BusinessQueries.sql
  05_StoredProcedures.sql
  06_PerformanceTuning.sql

diagrams/
screenshots/
```

## Example Business Questions

1. What is the confirmed fare total for each flight?
2. How many passengers have confirmed tickets?
3. Which routes have the highest revenue?
4. What percentage of seats are occupied?
5. How can frequently executed queries be optimized?

## How to Run

1. Install SQL Server and SQL Server Management Studio.
2. Clone or download this repository.
3. Execute the SQL scripts in the documented order.
4. Review the queries and compare their output with the expected results.

## Future Improvements

- Add stored procedures for booking workflows.
- Add transaction and error-handling scenarios.
- Add indexes and compare query performance.
- Add more advanced analytical reports.
- Document test cases and database design decisions.

## Author

SQL Server portfolio project created for hands-on database development practice and professional skill demonstration.

**Note:** This repository uses synthetic sample data and is an educational project, not a production airline booking system.
