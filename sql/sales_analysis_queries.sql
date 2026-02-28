-- =============================================
-- SALES PERFORMANCE ANALYSIS QUERIES
-- =============================================

-- 1️⃣ Total Sales
SELECT SUM(SalesAmount) AS Total_Sales
FROM FactInternetSales;


-- 2️⃣ Total Orders
SELECT COUNT(DISTINCT SalesOrderNumber) AS Total_Orders
FROM FactInternetSales;


-- 3️⃣ Sales by Year
SELECT 
    YEAR(OrderDate) AS Sales_Year,
    SUM(SalesAmount) AS Total_Sales
FROM FactInternetSales
GROUP BY YEAR(OrderDate)
ORDER BY Sales_Year;


-- 4️⃣ Sales by Region
SELECT 
    SalesTerritoryRegion,
    SUM(SalesAmount) AS Total_Sales
FROM FactInternetSales
GROUP BY SalesTerritoryRegion
ORDER BY Total_Sales DESC;


-- 5️⃣ Top 5 Products by Sales
SELECT TOP 5
    EnglishProductName,
    SUM(SalesAmount) AS Total_Sales
FROM FactInternetSales F
JOIN DimProduct P
    ON F.ProductKey = P.ProductKey
GROUP BY EnglishProductName
ORDER BY Total_Sales DESC;
