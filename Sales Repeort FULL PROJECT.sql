SELECT *
FROM superstore;

CREATE TABLE superstore1
LIKE superstore;

SELECT *
FROM superstore1;

INSERT superstore1
SELECT *
FROM superstore;

SELECT `Order_Date`,`Ship_Date`
FROM superstore1;

UPDATE superstore1
SET `Order_Date` = STR_TO_DATE(`Ship_Date`, '%m/%d/%Y');

UPDATE superstore1
SET `Ship_Date` = STR_TO_DATE(`Ship_Date`, '%m/%d/%Y');

SELECT *
FROM superstore1;

SELECT Order_Date,
EXTRACT(year FROM Order_Date) AS year
FROM superstore1;

SELECT YEAR(Order_Date) AS Year, 
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM superstore1
GROUP BY YEAR(Order_Date)
ORDER BY YEAR(Order_Date) ASC;

SELECT 
    QUARTER(Order_Date) AS quarter,
    YEAR(Order_Date) AS year,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profits
FROM superstore1
GROUP BY year, quarter
ORDER BY year, quarter;

SELECT 
    QUARTER(Order_Date) AS quarter,
    YEAR(Order_Date) AS year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profits
FROM superstore1
GROUP BY year, quarter
ORDER BY year, quarter;

SELECT region, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profits
FROM superstore1
GROUP BY region
ORDER BY total_profits DESC;


SELECT region, ROUND((SUM(profit) / SUM(sales)) * 100, 2) as profit_margin
FROM superstore1
GROUP BY region
ORDER BY profit_margin DESC;

SELECT State, ROUND(SUM(Sales),2) as Total_Sales, 
ROUND(SUM(Profit),2) as Total_Profits, 
ROUND((SUM(profit) / SUM(sales)) * 100, 2) as profit_margin
FROM superstore1
GROUP BY State
ORDER BY Total_Profits ASC
LIMIT 10;

SELECT City, ROUND(SUM(Sales),2) as Total_Sales, 
ROUND(SUM(Profit),2) as Total_Profits, 
ROUND((SUM(profit) / SUM(sales)) * 100, 2) as profit_margin
FROM superstore1
GROUP BY City
ORDER BY Total_Profits DESC
LIMIT 10;
