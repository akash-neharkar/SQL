-- Table: Employee

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of an employee.
 

-- Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).



-- # Write your MySQL query statement below

select max(e1.salary) as SecondHighestSalary 
from employee e1 join employee e2 on e1.salary < e2.salary;