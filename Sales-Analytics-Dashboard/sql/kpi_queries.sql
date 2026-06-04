-- =====================================
-- KPI QUERIES
-- =====================================

-- KPI 1: Total Sales
SELECT
ROUND(SUM(Sales),2) AS Total_Sales
FROM sales_data;

-- KPI 2: Total Profit
SELECT
ROUND(SUM(Profit),2) AS Total_Profit
FROM sales_data;

-- KPI 3: Profit Margin
SELECT
ROUND((SUM(Profit)/SUM(Sales))*100,2) AS Profit_Margin_Percentage
FROM sales_data;

-- KPI 4: Top Category
SELECT
Category,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;

-- KPI 5: Top Region
SELECT
Region,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;

-- KPI 6: Top Customer
SELECT
Customer_Name,
ROUND(SUM(Sales),2) AS Total_Sales
FROM sales_data
GROUP BY Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;