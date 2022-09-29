/* Query a count of the number of cities in CITY having a Population larger than 100.000
The table:

            CITY
c1.FIELD            c2.TYPE
ID                  NUMBER
NAME                VARCHAR2 (17)
COUNTRYCODE         VARCHAR2 (3)
DISTRICT            VARCHAR2 (20)
POPULATION          NUMBER
*/

SELECT COUNT(COUNTRYCODE) FROM CITY
WHERE POPULATION >= 100000