-- =====================================
-- DATABASE CREATION
-- =====================================

CREATE DATABASE SalesAnalytics;

USE SalesAnalytics;

-- =====================================
-- TABLE CREATION
-- =====================================

CREATE TABLE sales_data (
    Row_ID INT,
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country_Region VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

-- =====================================
-- DATA LOADING
-- =====================================

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =====================================
-- KPI QUERIES
-- =====================================

SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM sales_data;

SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM sales_data;

SELECT ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin
FROM sales_data;

-- =====================================
-- PRODUCT ANALYSIS
-- =====================================

SELECT Product_Name,
SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- =====================================
-- REGION ANALYSIS
-- =====================================

SELECT Region,
SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;

-- =====================================
-- CATEGORY ANALYSIS
-- =====================================

SELECT Category,
SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Category
ORDER BY Total_Profit DESC;

-- =====================================
-- CUSTOMER ANALYSIS
-- =====================================

SELECT Customer_Name,
SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;