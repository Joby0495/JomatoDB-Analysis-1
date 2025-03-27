-- Create the database
CREATE DATABASE JomatoDB;
GO

-- Use the database
USE JomatoDB;
GO

-- Create the table to store restaurant data
CREATE TABLE Restaurants (
    OrderId INT PRIMARY KEY,
    RestaurantName NVARCHAR(255),
    RestaurantType NVARCHAR(255),
    Rating FLOAT,
    [No.of.Rating] INT,
    AverageCost FLOAT,
    OnlineOrder NVARCHAR(3),
    TableBooking NVARCHAR(3),
    CuisinesType NVARCHAR(255),
    Area NVARCHAR(255),
    LocalAddress NVARCHAR(255),
    [Delivery time] INT
);
GO
-- Task 1: Create a user-defined function to stuff 'Chicken' into 'Quick Bites'
CREATE FUNCTION dbo.StuffChicken (@RestaurantType NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    RETURN CASE 
               WHEN @RestaurantType = 'Quick Bites' THEN 'Quick Chicken Bites'
               ELSE @RestaurantType 
           END
END;
GO

-- Task 2: Display restaurant name and cuisine type for the restaurant with the maximum number of ratings
SELECT 
    RestaurantName,
    CuisinesType,
    dbo.StuffChicken(RestaurantType) AS ModifiedRestaurantType
FROM Restaurants
WHERE [No.of.Rating] = (SELECT MAX([No.of.Rating]) FROM Restaurants);
GO

-- Task 3: Create a Rating Status column based on rating thresholds
SELECT 
    RestaurantName,
    Rating,
    CASE 
        WHEN Rating > 4 THEN 'Excellent'
        WHEN Rating > 3.5 THEN 'Good'
        WHEN Rating > 3 THEN 'Average'
        ELSE 'Bad'
    END AS RatingStatus
FROM Restaurants;
GO

-- Task 4 Part 1: Calculate CEIL, FLOOR, and ABS of Rating
SELECT 
    RestaurantName,
    Rating,
    CEILING(Rating) AS CeilRating,
    FLOOR(Rating) AS FloorRating,
    ABS(Rating) AS AbsRating
FROM Restaurants;
GO

-- Task 4 Part 2: Display current date and its components separately
SELECT 
    GETDATE() AS CurrentDate,
    YEAR(GETDATE()) AS Year,
    DATENAME(MONTH, GETDATE()) AS MonthName,
    DAY(GETDATE()) AS Day;
GO

-- Task 5: Display restaurant type and average of AverageCost using ROLLUP
SELECT 
    RestaurantType,
    AVG(AverageCost) AS AvgAverageCost
FROM Restaurants
GROUP BY ROLLUP(RestaurantType);
GO