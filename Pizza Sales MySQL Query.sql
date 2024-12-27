SELECT *
FROM pizza_sale;

CREATE TABLE pizza_sales
LIKE pizza_sale;

SELECT *
FROM pizza_sales;

INSERT pizza_sale
SELECT *
FROM pizza_sales;

SELECT *
FROM pizza_sale;

SELECT `order_date`
FROM pizza_sale;

UPDATE pizza_sale
SET `order_date` = STR_TO_DATE(`order_date`, '%m/%d/%Y');

SELECT *
FROM pizza_sale;

-- Total Pizza Sold
SELECT SUM(quantity) AS total_pizza_sold
FROM pizza_sale;

-- Total Orders Placed
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sale;

-- Total Revenue
SELECT ROUND(SUM(total_price),2) AS total_revenue
FROM pizza_sale;

-- Average Pizza Sales Per Order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS avg_pizza_per_order
FROM pizza_sale;

-- Order each day of week
SELECT DAYOFWEEK(order_date) AS day_of_week, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sale
WHERE (order_date) IS NOT NULL
GROUP BY day_of_week;

-- Monthly Trend for Total Orders
SELECT MONTHNAME(order_date) AS month_name,
COUNT(DISTINCT order_id) As total_orders
FROM pizza_sale
GROUP BY month_name;

-- Percentage Sales by Pizza Size
SELECT pizza_size, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sale),2) AS percentage_of_total_sales
FROM pizza_sale
GROUP BY pizza_size;

-- Top % best sellers by revenue, total quantity, and total orders
-- Revenue
SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sale
GROUP BY pizza_name
ORDER BY 2 DESC
LIMIT 5;

-- Total Quantity
SELECT pizza_name, SUM(quantity) AS total_quantity
FROM pizza_sale
GROUP BY pizza_name
ORDER BY 2 DESC
LIMIT 5;

-- Total Orders
SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sale
GROUP BY pizza_name
ORDER BY 2 DESC
LIMIT 5;

-- Total Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sale
GROUP BY pizza_name
ORDER BY 2 DESC
LIMIT 5;

SELECT *
FROM pizza_sale; 

-- Category with the most orders
SELECT pizza_category, COUNT(DISTINCT order_id) AS total_orders_per_category
FROM pizza_sale
GROUP BY pizza_category
ORDER BY 2 DESC;

-- Category with the most sales
SELECT pizza_category, ROUND(SUM(total_price),2) AS total_price_per_category
FROM pizza_sale
GROUP BY pizza_category
ORDER BY 2 DESC;