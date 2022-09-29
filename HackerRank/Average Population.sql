/* Query the average population for all cities in CITY, rounded down to the nearest integer.*/

--Solution1 via MySQL:

SELECT ROUND(AVG(Population)) FROM City

--Solution2 via MySQL:

SELECT FLOOR(AVG(Population)) FROM City 