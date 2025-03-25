CREATE DATABASE JomatoDB;
GO

USE JomatoDB;
GO

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
