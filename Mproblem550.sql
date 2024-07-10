-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key (combination of columns with unique values) of this table.
-- This table shows the activity of players of some games.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.



-- # Write your MySQL query statement below
WITH cte AS (SELECT *, min(event_date) OVER(PARTITION BY player_id) AS first_login
FROM activity)

SELECT
round(count(DISTINCT a1.player_id) / (SELECT count(DISTINCT player_id) FROM activity), 2) 
AS fraction
FROM cte a1
JOIN cte a2
ON a1.player_id = a2.player_id AND datediff(a2.event_date, a1.event_date) = 1 
AND
a1.first_login = a1.event_date