SELECT price FROM properties;


--A join involving at least four relations
SELECT		
FROM		
WHERE		






--A self-join
--This query displays pairs of properties with the same rent per house
SELECT	DISTINCT	p1.propertyname, p2.propertyname
FROM			properties p1, properties p2
WHERE			p1.rentperhouse=p2.rentperhouse AND ASCII(p1.propertyname) > ASCII(p2.propertyname)


--UNION, INTERSECT, and/or MINUS
SELECT		
FROM		
WHERE		


--SUM, AVG, MAX, and/or MIN
--sum(max of property, avg mortgage value, max renthouseprice
SELECT		firstname, lastname, SUM(price), AVG(mortgagevalue), MAX(rentperhouse)
FROM		properties, players
WHERE		need to finish this part


--GROUP BY, HAVING, and ORDER BY, all appearing in the same query
SELECT		
FROM		
WHERE		


--A correlated subquery
SELECT		
FROM		
WHERE		


--A non-correlated subquery
SELECT		
FROM		
WHERE		


--A relational DIVISION query
SELECT		
FROM		
WHERE		


--An outer join query
SELECT		
FROM		
WHERE		


--A RANK query
--This query selects the player with the third most money in their bank account
SELECT		RANK(140) WITHIN GROUP
		(ORDER BY price DESC)  "Rank of 200"
		FROM properties;

--A Top-N query
--This query displays the top 5 most expensive properties
SELECT		propertyname, location, price
FROM		properties
WHERE		ROWNUM < 6
ORDER BY	price DESC;
