WITH RECURSIVE REACHABLE(FromCity, Destination, Route, Full_Price) AS
--(1) Initial Subquery
(SELECT FromCity, ToCity, CONCAT(FromCity,'->',ToCity), Price
FROM FLIGHTS
WHERE FromCity = 'Athens'
UNION ALL
--(2) Recursive Subquery
SELECT inn.FromCity, outt.ToCity, CONCAT(inn.Route,' | ',outt.FromCity, ' -> ',outt.ToCity), inn.Full_Price + outt.Price
FROM REACHABLE inn, FLIGHTS outt
WHERE inn.Destination = outt.FromCity
)

--(3) Result Query
SELECT R.* 
FROM REACHABLE R
INNER JOIN 
(SELECT FromCity, Destination, MIN(Full_Price) as Full_Price
FROM REACHABLE
WHERE Destination = 'Denpasar'
GROUP BY FromCity, Destination) A
ON R.FromCity = A.FromCity AND R.Destination = A.Destination
WHERE R.Full_Price=A.Full_Price
