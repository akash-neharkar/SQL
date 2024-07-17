-- Table: Seat

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | student     | varchar |
-- +-------------+---------+
-- id is the primary key (unique value) column for this table.
-- Each row of this table indicates the name and the ID of a student.
-- id is a continuous increment.
 

-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

-- Return the result table ordered by id in ascending order.



-- # Write your MySQL query statement below
SELECT IF (id < (SELECT MAX(id) FROM Seat), 
            IF(id % 2 = 0, id - 1, id + 1), 
            IF(id % 2 = 0, id - 1, id)
        ) AS id, student
FROM Seat
ORDER BY id;