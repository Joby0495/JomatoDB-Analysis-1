# JomatoDB-Analysis-1

This project involves analyzing a dataset of restaurants using SQL queries. The dataset contains information about various restaurants in a city, including their names, types, ratings, costs, and more, provided by a hypothetical food delivery platform similar to Jomato.

## Files

- **`schema.sql`**: SQL script to create the `JomatoDB` database and the `Restaurants` table.
- **`data.csv`**: CSV file containing the restaurant dataset (7104 entries).
- **`queries.sql`**: SQL script with a user-defined function and queries for analysis.

## How to Use

1. **Create the Database and Table:**
   - Run the `schema.sql` script in SQL Server to set up the `JomatoDB` database and `Restaurants` table.

2. **Import the Data:**
   - Import the data from `data.csv` into the `Restaurants` table using SQL Server’s BULK INSERT command. Example:
     ```sql
     BULK INSERT Restaurants
     FROM 'C:\path\to\data.csv'  -- Replace with the actual file path
     WITH (
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n',
         FIRSTROW = 2  -- Skips the header row
     );
