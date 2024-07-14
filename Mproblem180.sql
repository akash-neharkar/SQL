-- Table: Logs

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column.
 

-- Find all numbers that appear at least three times consecutively.

-- Return the result table in any order.



-- # Write your MySQL query statement below
SELECT DISTINCT l1.num AS ConsecutiveNums FROM logs l1, logs l2, logs l3
WHERE l1.id=l2.id+1 AND l1.num=l2.num
AND l1.id=l3.id+2 AND l1.num= l3.num