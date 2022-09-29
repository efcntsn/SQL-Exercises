/* Query the sum of Northern Latitudes (LAT_N) from STATION having values 
greater than 38.7880 and less than 137.2345. 
Truncate your answer to 4 decimal places. */

SELECT
    TRUNCATE(SUM(Lat_N),4)
FROM STATION
    WHERE 38.7880 < Lat_N AND Lat_N <137.2345



--Note1: Truncate means 'cut'
--Note2: SELECT TRUNCATE(123.456789 , 3) --> Output: 123.456 
--                                              (there are three decimals)
