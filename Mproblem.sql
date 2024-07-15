-- Table: Accounts

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | account_id  | int  |
-- | income      | int  |
-- +-------------+------+
-- account_id is the primary key (column with unique values) for this table.
-- Each row contains information about the monthly income for one bank account.
 

-- Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

-- "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.
-- The result table must contain all three categories. If there are no accounts in a category, return 0.

-- Return the result table in any order.



-- # Write your MySQL query statement below
WITH CTE AS (SELECT *, case 
when income <20000 then "Low Salary" 
when income >= 20000 and income <= 50000 then "Average Salary" else "High Salary" end as category
FROM Accounts),
CTE1 AS (SELECT "High Salary" as category
 union SELECT "Low Salary" AS category
 union SELECT "Average Salary" AS category)


SELECT category, coalesce(count(income),0) as accounts_count
FROM CTE 
right JOIN CTE1 using (category)
group by category