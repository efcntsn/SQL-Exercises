/*Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of two decimal places.
The sum of all values in LONG_W rounded to a scale of two decimal places.

Table:

STATION

Field       Type
ID          NUMBER
CITY        VARCHAR2 (21)
STATE       VARCHAR2 (2)
LAT_N       NUMBER
LONG_W      NUMBER

 */

SELECT
    Round(SUM(Lat_N),2),
    Round(SUM(Long_W),2)
FROM Station

--Note: For rounding to scale of # decimal places, use ROUND(NUMBER, #) function