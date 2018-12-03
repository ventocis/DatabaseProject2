SPOOL project.out
SET ECHO ON
/*
CIS 353 - Database Design Project
Devin Monday
Kyle VanDelHeuvel
Samuel Ventocilla
Nathan VandenHoek
*/

--< The SQL/DDL code that creates your schema >

--
-- Drop the tables
--
DROP TABLE players CASCADE CONSTRAINTS;
DROP TABLE game CASCADE CONSTRAINTS;
DROP TABLE properties CASCADE CONSTRAINTS;
DROP TABLE special_properties CASCADE CONSTRAINTS;
DROP TABLE special_spaces CASCADE CONSTRAINTS;
DROP TABLE plays CASCADE CONSTRAINTS;
DROP TABLE rent CASCADE CONSTRAINTS;
--
-- Create tables
--
CREATE TABLE players (
	username	VARCHAR2(15),
	bankaccount	INTEGER,
	gamepiece	INTEGER,
	password	INTEGER,
	firstname	VARCHAR2(20),
	lastname	VARCHAR2(30),
--
-- PlIC1: All players must have a unique username
CONSTRAINT PlIC1 UNIQUE (username)
);
--
CREATE TABLE playhistory(
	dateplayed	date,
	endbalance	INTEGER,
	endresult	char
);
--
CREATE TABLE game (
	gameID		INTEGER PRIMARY KEY,
	gamerules	VARCHAR2(5),
	numPlayers	INTEGER
--
-- GIC1: There can be no more than 6 players in a game
CONSTRAINT GIC1 CHECK (numPlayers <= 6)
);
--
CREATE TABLE properties (
	propertyname		VARCHAR2(15) PRIMARY KEY,
	mortgagevalue		INTEGER,
	rentperhouse		INTEGER,
	price			INTEGER,
	renthouseprice		INTEGER,
	location		INTEGER,
	username,
-- PRIC1: The property name is the foreign key for the player
CONSTRAINT PRIC1 FOREIGN KEY (username) REFERENCES players (username)
);
--
CREATE TABLE special_properties (
	location	INTEGER PRIMARY KEY,
	rent		INTEGER,
	price		INTEGER,
	propertype	VARCHAR2(10)
--
-- SPIC1: If type is utilities the price can't be more than $250
CONSTRAINT SPIC1 CHECK (NOT(type = "utilities" AND price > 250)
);
--
CREATE TABLE special_spaces (
	locationnumber	INTEGER PRIMARY KEY,
	spacetype	VARCHAR2(15)
);
--
CREATE TABLE plays (
	PRIMARY KEY (username, gameID)
);
--
CREATE TABLE rent (
	primary key (
		username@
		rentamt number)
);



SET FEEDBACK OFF

--< The INSERT statements that populate the tables>
--Important: Keep the number of rows in each table small enough so that the results of your
--queries can be verified by hand. See the Sailors database as an example.

insert into players values ('MunyBags', 2100, 'moneysack', 'Abc123', 'Paul', 'Dumpling');
insert into players values ('BoardRunner32', 2100, 'boot', 'justdoit', 'Rachel', 'Spearson');
insert into player values ('DogLover12', 2100, 'dog', 'gold9retriver', 'Francine', 'Filimer');
insert into player values ('Railroader', 2100, 'battleship', 'reading112', 'Nigel', 'Thomas');
insert into player values ('MonopolyMan99';, 2100, 'tophat', 'Iluvmonopoly', 'Frank', 'Monoper');
insert into player values ('Dog39Lover', 2100, 'dog', 'd0ggy1234', 'Chris', 'Tyson');
insert into player values ('PropertyKing', 2100, 'thimble', 'password123', 'Frank', 'Saliem');
insert into player values ('BoardGamePro13', 2100, 'car', '1337pass', 'Trent', 'Tigerson');
insert into game values (111111,'YYNNN', 4);
insert into game values (123456, 'NNNNN', 4);
insert into game values (813923, 'YNYNY', 6);
insert into game values (382113, 'YYYYY', 6);
insert into game values (138233, 'NNYYN', 2);
insert into game values (198273, 'YNNYY', 3);
insert into properties values ('Baltic', 30, 30, 60, 50, 4);
insert into properties values ('Vermont', 50, 50, 100, 50, 9);
insert into properties values ('States', 70, 50, 140, 100, 14);
insert into properties values ('NewYork',100 ,75 ,200 ,100 , 20);
insert into properties values ('Kentucky', 110, 100, 220, 150, 22);
insert into properties values ('Atlantic', 130, 125, 260, 150, 27);
insert into properties values ('Pacific', 150, 175, 300, 200, 32);
insert into properties values ('BoardWalk', 200, 200, 400, 200, 40);
insert into special_properties values (6, 50, 200, 'Railroad');
insert into special_properties values (16, 50, 200, 'RailRoad');
insert into special_properties values (13, 90, 150, 'Utility');
insert into special_propoerties values (29, 70, 150,'Utility');
insert into special_spaces vaules (1, 'Go');
insert into special_spaces values (5, 'Income Tax');
insert into special_spaces values (11, 'Jail');
insert into special _spaces values (21, 'Free Parking');
insert into special_spaces values (31, 'Go To Jail');
insert into special_spaces values (39, 'Luxury Tax');
SET FEEDBACK ON
COMMIT;

--< One query (per table) of the form: SELECT * FROM table; in order to print out your
--database >

SELECT * FROM players;
SELECT * FROM playhist;
SELECT * FROM game;
SELECT * FROM properties;
SELECT * FROM special_properties;
SELECT * FROM special_spaces;
SELECT * FROM plays;
SELECT * FROM rent;

--< The SQL queries>. Include the following for each query:
--1. A comment line stating the query number and the feature(s) it demonstrates
--(e.g. – Q25 – correlated subquery).
--2. A comment line stating the query in English.
--3. The SQL code for the query.
SELECT price FROM properties;


--A join involving at least four relations
SELECT		
FROM		
WHERE		


--A self-join
--This query displays pairs of properties with the same rent per house
SELECT DISTINCT	p1.propertyname, p2.propertyname
FROM	properties p1, properties p2
WHERE	p1.renthouseprice=p2.renthouseprice AND 
	ASCII(p1.propertyname) > ASCII(p2.propertyname);


--UNION, INTERSECT, and/or MINUS
SELECT		
FROM		
WHERE		


--SUM, AVG, MAX, and/or MIN
--sum(max of property, avg mortgage value, max renthouseprice
SELECT	firstname, lastname, SUM(price), AVG(mortgagevalue), MAX(rentperhouse)
FROM	properties, players
WHERE	need to finish this part


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
SELECT	RANK(140) WITHIN GROUP
	(ORDER BY price DESC)  "Rank of 200"
FROM properties;

--A Top-N query
--This query displays the top 5 most expensive properties
SELECT		propertyname, location, price
FROM		properties
WHERE		ROWNUM < 6
ORDER BY	price DESC;

--< The insert/delete/update statements to test the enforcement of ICs >
--Include the following items for every IC that you test (Important: see the next section titled
-- "Submit a final report" regarding which ICs to test).
  --A comment line stating: Testing: < IC name>
  --A SQL INSERT, DELETE, or UPDATE that will test the IC.
COMMIT;
--
SPOOL OFF

