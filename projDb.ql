SPOOL project.out
SET ECHO ON
/*
CIS 353 - Database Design Project
<One line per team member name>
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
	username	VARCHAR2(15) PRIMARY KEY,
	bankaccount	INTEGER,
	gamepiece	INTEGER,
	password	INTEGER,
	firstname	VARCHAR2(20),
	lastname	VARCHAR2(30)
);
--
CREATE TABLE game (
	gameID		INTEGER,
	gamerules	VARCHAR2(5),
	playersingame	INTEGER
);
--
CREATE TABLE properties (
	propertyname		VARCHAR2(15),
	mortgagevalue		INTEGER,
	rentperhouse		INTEGER,
	price			INTEGER,
	renthouseprice	INTEGER,
	location		INTEGER
);
--
CREATE TABLE special_properties (
	location	INTEGER,
	rent		INTEGER,
	price		INTEGER,
	propertype	VARCHAR2(10)
);
--
CREATE TABLE special_spaces (
	locationnumber	INTEGER,
	spacetype		VARCHAR2(15)
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
SET FEEDBACK ON
COMMIT;

--< One query (per table) of the form: SELECT * FROM table; in order to print out your
--database >

--< The SQL queries>. Include the following for each query:
--1. A comment line stating the query number and the feature(s) it demonstrates
--(e.g. – Q25 – correlated subquery).
--2. A comment line stating the query in English.
--3. The SQL code for the query.

--< The insert/delete/update statements to test the enforcement of ICs >
--Include the following items for every IC that you test (Important: see the next section titled
-- "Submit a final report" regarding which ICs to test).
  --A comment line stating: Testing: < IC name>
  --A SQL INSERT, DELETE, or UPDATE that will test the IC.
COMMIT;
--
SPOOL OFF
