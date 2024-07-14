-- Table: Products

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key (combination of columns with unique values) of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.
 

-- Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- Return the result table in any order.



-- # Write your MySQL query statement below
WITH cte AS
(SELECT*, RANK() OVER(PARTITION BY product_id 
ORDER BY change_date DESC) AS r
FROM Products
WHERE change_date <= '2019-08-16')

SELECT product_id, new_price AS price 
FROM cte 
WHERE r = 1
UNION 
SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM cte)