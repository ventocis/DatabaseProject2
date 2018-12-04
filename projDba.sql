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
DROP TABLE playhistory CASCADE CONSTRAINTS;
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
	gamepiece	VARCHAR2(10),
	password	VARCHAR2(20),
	firstname	VARCHAR2(20),
	lastname	VARCHAR2(30),
--
-- PlIC1: All players must have a unique username
CONSTRAINT PlIC1 UNIQUE (username)
);
--
CREATE TABLE playhistory(
	username  VARCHAR2(15),
	dateplayed	date,
	endbalance	INTEGER,
	endresult	char(1),
	primary key  (username, dateplayed),
--PHIC1 The username is a foreign key for the player.
CONSTRAINT PIC1 FOREIGN KEY(username) REFERENCES players (username)	
);
--
CREATE TABLE game (
	gameID		INTEGER PRIMARY KEY,
	gamerules	VARCHAR2(5),
	numPlayers	INTEGER,
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
	renthouseprice	INTEGER,
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
	property_type	VARCHAR2(10),

CONSTRAINT PIC1 FOREIGN KEY(location) REFERENCES properties (location)

CONSTRAINT P1C2 FOREIGN KEY(rent) REFERENCES properties (rent)

-- SPIC1: If type is utilities the price can't be more than $250
CONSTRAINT SPIC1 CHECK (NOT(property_type = 'utilities' AND price > 250))
);
--
CREATE TABLE special_spaces (
	locationnumber	INTEGER PRIMARY KEY,
	spacetype	VARCHAR2(15),

CONSTRAINT P1C1 FOREIGN KEY (locationnumber) REFERENCES properties (location)
);
--
CREATE TABLE plays (
	username	VARCHAR2(15),
	gameID		INTEGER,
	PRIMARY KEY (username, gameID),
--PIC1: The username is the foreign key for the player
CONSTRAINT PIC1 FOREIGN KEY (username) REFERENCES players (username),
--PIC2: The gameID is the foreign key for the game.
CONSTRAINT PIC2 FOREIGN KEY (gameID) REFERENCES game (gameID)
);
--
CREATE TABLE rent (
	username	VARCHAR2(15),
	rentamt	INTEGER,
	primary key (username, rentamt),
--AIC1: The username is the foreign key for the rent.
CONSTRAINT AIC1 FOREIGN KEY (username) REFERENCES players (username)
);



SET FEEDBACK OFF

--< The INSERT statements that populate the tables>
--Important: Keep the number of rows in each table small enough so that the results of your
--queries can be verified by hand. See the Sailors database as an example.

insert into players values ('MunyBags', 2100, 'moneysack', 'Abc123', 'Paul', 'Dumpling');
insert into players values ('BoardRunner32', 2100, 'boot', 'justdoit', 'Rachel', 'Spearson');
insert into players values ('DogLover12', 2100, 'dog', 'gold9retriver', 'Francine', 'Filimer');
insert into players values ('Railroader', 2100, 'battleship', 'reading112', 'Nigel', 'Thomas');
insert into players values ('MonopolyMan99', 2100, 'tophat', 'Iluvmonopoly', 'Frank', 'Monoper');
insert into players values ('Dog39Lover', 2100, 'dog', 'd0ggy1234', 'Chris', 'Tyson');
insert into players values ('PropertyKing', 2100, 'thimble', 'password123', 'Frank', 'Saliem');
insert into players values ('BoardGamePro13', 2100, 'car', '1337pass', 'Trent', 'Tigerson');
insert into game values (111111,'YYNNN', 4);
insert into game values (123456, 'NNNNN', 4);
insert into game values (813923, 'YNYNY', 6);
insert into game values (382113, 'YYYYY', 6);
insert into game values (138233, 'NNYYN', 2);
insert into game values (198273, 'YNNYY', 3);
insert into properties values ('Baltic', 30, 30, 60, 50, 4, 'BoardGamePro13');
insert into properties values ('Vermont', 50, 50, 100, 50, 9, 'MonopolyMan99');
insert into properties values ('States', 70, 50, 140, 100, 14, 'Dog39Lover');
insert into properties values ('NewYork',100 ,75 ,200 ,100 , 20, 'DogLover12');
insert into properties values ('Kentucky', 110, 100, 220, 150, 22,'Railroader');
insert into properties values ('Atlantic', 130, 125, 260, 150, 27, 'PropertyKing');
insert into properties values ('Pacific', 150, 175, 300, 200, 32, 'MunyBags');
insert into properties values ('BoardWalk', 200, 200, 400, 200, 40, 'MunyBags');
insert into special_properties values (6, 50, 200, 'Railroad');
insert into special_properties values (16, 50, 200, 'RailRoad');
insert into special_properties values (13, 90, 150, 'Utility');
insert into special_properties values (29, 70, 150,'Utility');
insert into special_spaces values (1, 'Go');
insert into special_spaces values (5, 'Income Tax');
insert into special_spaces values (11, 'Jail');
insert into special_spaces values (21, 'Free Parking');
insert into special_spaces values (31, 'Go To Jail');
insert into special_spaces values (39, 'Luxury Tax');
insert into playhistory values('MunyBags', TO_DATE('11/10/18', 'MM/DD/YY'), 3550, 'W');
insert into playhistory values('Railroader', TO_DATE('11/14/18', 'MM/DD/YY'), 0, 'L');
insert into playhistory values('PropertyKing', TO_DATE('11/18/18','MM/DD/YY'), 1300, 'W');
insert into playhistory values('MonopolyMan99', TO_DATE('11/10/18', 'MM/DD/YY'), 0, 'L');
insert into playhistory values('Dog39Lover', TO_DATE('11/10/18', 'MM/DD/YY'), 0, 'L');
insert into playhistory values('MunyBags', TO_DATE('11/14/18', 'MM/DD/YY'), 3250, 'W');
insert into playhistory values('DogLover12', TO_DATE('11/19/18','MM/DD/YY'), 1500, 'W');
insert into plays values('MunyBags', 111111);
insert into plays values('MunyBags', 813923);
insert into plays values ('Railroader', 813923);
insert into plays values('PropertyKing', 382113);
insert into plays values('MonopolyMan99', 111111);
insert into plays values('Dog39Lover', 111111);
insert into plays values('DogLover12', 198273);
insert into plays values('BoardGamePro13', 198273);
insert into rent values('MunyBags', 2000);
insert into rent values('PropertyKing', 300);
insert into rent values('DogLover12', 12);
insert into rent values('MunyBags', 1500);
insert into rent values('BoardGamePro13', 6);
insert into rent values('Railroader', 120);
insert into rent values('Dog39Lover', 175);
insert into rent values('MonopolyMan99', 350);
SET FEEDBACK ON
COMMIT;

--< One query (per table) of the form: SELECT * FROM table; in order to print out your
--database >

SELECT * FROM players;
SELECT * FROM playhistory;
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


--(Q1) A join involving at least four relations
--This query finds the players who have won in a game against 6 players and displays the username, game id, and the date played for each player.
SELECT DISTINCT P.username, G.gameID, Ph.dateplayed		
FROM	players P, game G, playhistory PH, plays	S
WHERE	P.username = S.username AND P.username = PH.username AND S.username = PH.username 
	AND G.gameID = S.gameID AND G.numplayers = 6 AND PH.endresult LIKE 'W';


--(Q2) A self-join
--This query displays pairs of properties with the same rent per house.
SELECT DISTINCT	p1.propertyname, p2.propertyname
FROM	properties p1, properties p2
WHERE	p1.renthouseprice=p2.renthouseprice AND 
	ASCII(p1.propertyname) > ASCII(p2.propertyname);


--(Q3) UNION, INTERSECT, and/or MINUS
SELECT		
FROM		
WHERE		



--(Q4) SUM query that includesGROUP BY, HAVING, and ORDER BY, all appearing in the same query
/*This query displays the username, first name, last name, and sum of their ending balances of all players that have a sum of their ending balances that is greater than 0. It then groups those results by the username and orders them starting with the player with the highest ending balance*/
SELECT		PH.username, P.firstname, P.lastname, SUM(endbalance)
FROM		playhistory PH, players P
WHERE		PH.username = P.username
GROUP BY	PH.username,P.firstname,P.lastname
HAVING		SUM(endbalance) > 0
ORDER BY	SUM(endbalance) DESC;


--(Q5) A correlated subquery
--This query finds all new players who do not have a histroy of playing monopoly whose bankaccount is greater than 1000 and displays their firstname, username, and gamepiece.
SELECT P.username, P.firstname, P.gamepiece		
FROM	players P
WHERE	P.bankaccount > 1000 AND
	NOT EXISTS (SELECT * FROM playerhistory PR WHERE P.username = PR.username);



--(Q6) A non-correlated subquery
--This query displays the username of all players with a bank account value of 2100 and an ending balance in a previous gamee that is greater than 0
SELECT	username
FROM	players
WHERE	bankaccount = 2100 AND username IN(SELECT username
						  FROM 	playhistory
						  WHERE	endbalance > 0);


--(Q7) A relational DIVISION query
SELECT
FROM		
WHERE		


--(Q8) An outer join query
--Select the username and number of properties of all players that have more than 3 properties.

SELECT P.username, COUNT(properties)		
FROM	players P LEFT OUTER JOIN properties PR ON P.username = PR.username AND
	COUNT(properties) > 3;


--(Q9) A RANK query
--This query selects the player with the third most money in their bank account
SELECT	RANK(140) WITHIN GROUP
	(ORDER BY price DESC)  "Rank of 200"
FROM properties;

--(Q10) A Top-N query
--This query displays the top 5 most expensive properties
SELECT		propertyname, location, price
FROM		(SELECT *
		FROM properties
		ORDER BY price DESC)
WHERE		ROWNUM < 6;


--< The insert/delete/update statements to test the enforcement of ICs >
--Include the following items for every IC that you test (Important: see the next section titled
-- "Submit a final report" regarding which ICs to test).
  --A comment line stating: Testing: < IC name>
  --A SQL INSERT, DELETE, or UPDATE that will test the IC.

--
SET ECHO OFF
SPOOL OFF
