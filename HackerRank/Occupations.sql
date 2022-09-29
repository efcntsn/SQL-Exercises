/* Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation. */

--SOLUTION WAY-1:

SELECT Doctor,Professor,Singer,Actor
FROM 
    (SELECT NameOrder,
        max(case Occupation when 'Doctor' then Name end) AS Doctor,
        max(case Occupation when 'Professor' then Name end) AS Professor,
        max(case Occupation when 'Singer' then Name end) AS Singer,
        max(case Occupation when 'Actor' then Name end) AS Actor
    FROM
        (SELECT Occupation,Name,row_number() OVER (PARTITION BY Occupation ORDER BY Name ASC) AS NameOrder
         FROM Occupations) AS NameLists
    GROUP BY NameOrder) AS Names


--SOLUTION WAY-2:    

set @d=0, @p=0,@s=0,@a=0;
select
max(doctor_names), 
max(Professor_names),
max(Singer_names),
max(Actor_names) 
from
(select
case when Occupation='Doctor' then Name end as doctor_names,
case when Occupation='Professor' then Name end as Professor_names,
case when Occupation='Singer' then Name end as Singer_names,
case when Occupation='Actor' then Name end as Actor_names,
case
when Occupation='Doctor' then (@d:=@d+1)
when Occupation='Professor' then (@p:=@p+1)
when Occupation='Singer' then (@s:=@s+1)
when Occupation='Actor' then (@a:=@a+1)
end as count
from occupations
order by Name) t1
group by count;

--SOLUTION WAY-3:

SELECT
    MAX(IF(OCCUPATION = "DOCTOR",NAME,NULL)) AS DOCTOR ,
    MAX(IF(OCCUPATION = "PROFESSOR",NAME,NULL)) AS PROFESSOR ,
    MAX(IF(OCCUPATION = "SINGER",NAME,NULL)) AS SINGER ,
    MAX(IF(OCCUPATION = "ACTOR",NAME,NULL)) AS ACTOR
FROM
(select 
    name,occupation,row_number()
    Over (PARTITION BY occupation ORDER BY name) as row_num 
FROM occupations) AS ord group by row_num ;