/* Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy 
each non-evil wand of high power and age. 

Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, 
sorted in order of descending power. 

If more than one wand has same power, sort the result in order of descending age. */


SELECT aa.id, bb.age, aa.coins_needed, aa.power

FROM 
Wands AS aa JOIN Wands_Property AS bb ON aa.code = bb.code

JOIN 
(SELECT age AS AG, MIN(coins_needed) AS MINCN, power AS PW 
FROM 
Wands AS A JOIN Wands_Property AS B ON A.code = B.code
WHERE is_evil = 0 GROUP BY power, age) 

AS Q ON bb.age = AG AND aa.coins_needed = MINCN AND aa.power = PW

ORDER BY aa.power DESC, bb.age DESC





