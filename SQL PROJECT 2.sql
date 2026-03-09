CREATE DATABASE sql_project_p2;
use sql_project_p2;
DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );

SELECT COUNT(transaction_id) AS total_transactions
FROM retail_sales;


SELECT SUM(total_sale) AS total_revenue
FROM retail_sales;

-- Average order sales;
SELECT AVG(total_sale) AS avg_sale
FROM retail_sales;

-- Sales by category
SELECT category,
SUM(total_sale) AS revenue
FROM retail_sales
GROUP BY category
ORDER BY revenue DESC;

-- Sales by gender
SELECT gender,
SUM(total_sale) AS revenue
FROM retail_sales
GROUP BY gender;

-- Monthly sales trend
SELECT
YEAR(sale_date) AS year,
MONTH(sale_date) AS month,
SUM(total_sale) AS revenue
FROM retail_sales
GROUP BY year, month
ORDER BY year, month;

-- Top customers
SELECT customer_id,
SUM(total_sale) AS revenue
FROM retail_sales
GROUP BY customer_id
ORDER BY revenue DESC
LIMIT 10;

-- Best selling categories
SELECT category,
SUM(quantity) AS total_quantity
FROM retail_sales
GROUP BY category
ORDER BY total_quantity DESC;

-- Profit by category
SELECT category,
SUM(total_sale - cogs) AS profit
FROM retail_sales
GROUP BY category
ORDER BY profit DESC;

-- Peak shopping hour
SELECT HOUR(sale_time) AS hour,
COUNT(*) AS transactions
FROM retail_sales
GROUP BY hour
ORDER BY transactions DESC;

-- Customer age revenue analysis
SELECT age,
SUM(total_sale) AS revenue
FROM retail_sales
GROUP BY age
ORDER BY revenue DESC;

-- Data quality check for NULL values
SELECT *
FROM retail_sales
WHERE total_sale IS NULL;

-- Duplicate transaction check
SELECT transaction_id, COUNT(*)
FROM retail_sales
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- Create analysis view
CREATE VIEW category_sales_summary AS
SELECT category,
SUM(quantity) AS total_units,
SUM(total_sale) AS total_revenue
FROM retail_sales
GROUP BY category;

-- View result
SELECT * FROM category_sales_summary;

-- Create index for faster queries
CREATE INDEX idx_category
ON retail_sales(category);

SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
    

DELETE FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

select * from retail_sales;
SET SQL_SAFE_UPDATES = 0;
