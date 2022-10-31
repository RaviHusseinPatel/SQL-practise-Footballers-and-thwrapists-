DROP TABLE Meetings;
DROP TABLE Players;
DROP TABLE Team;
DROP TABLE Therapists;

CREATE TABLE Therapists(
ID Serial PRIMARY Key,
name varchar (255),
mobileNumber int
);

CREATE TABLE Team(
ID Serial Primary Key,
name varchar(255),
squadSize int,
internationalBreak boolean
);

CREATE TABLE Players (
    ID Serial Primary Key,
    name varchar(255),
    position varchar(255),
    age int,
    Team_ID int references Team(ID)
);

CREATE TABLE Meetings (
    ID Serial Primary Key,
    Team_ID int references Team(ID),
    Therapists_ID int references Therapists(ID),
    day varchar(255)
);

--Drop table in reverse order to create table
--INSERT

INSERT INTO Therapists (name, mobileNumber) VALUES ('Colin', 12873);
INSERT INTO Therapists (name, mobileNumber) VALUES ('Valeria', 78663);
INSERT INTO Therapists (name, mobileNumber) VALUES ('Ben', 98723);
INSERT INTO Therapists (name, mobileNumber) VALUES ('Kenny', 67752);
INSERT INTO Therapists (name, mobileNumber) VALUES ('Raheela', 77762);
INSERT INTO Therapists (name, mobileNumber) VALUES ('Iain', 37845);


INSERT INTO Team (name, squadSize, internationalBreak) VALUES ('Chelsea', 18, FALSE);
INSERT INTO Team (name, squadSize, internationalBreak) VALUES ('Barca', 22, FALSE);
INSERT INTO Team (name, squadSize, internationalBreak) VALUES ('Madrid', 21, TRUE);
INSERT INTO Team (name, squadSize, internationalBreak) VALUES ('City', 24, FALSE);

INSERT INTO Players (name, position, age, Team_ID) VALUES ('Mount', 'Midfielder', 22,1);
INSERT INTO Players (name, position, age, Team_ID)VALUES ('James','Defender', 21,1 );
INSERT INTO Players (name, position, age, Team_ID)VALUES ('Havertz','Forward', 23,1 );
INSERT INTO Players (name, position, age, Team_ID) VALUES ('Kante','Midfielder', 29, 1);
INSERT INTO Players (name, position, age, Team_ID) VALUES ('Pedri', 'Midfielder', 20,2);
INSERT INTO Players (name, position, age, Team_ID) VALUES ('Pique','Defender', 31,2);
INSERT INTO Players (name, position, age, Team_ID)VALUES ('Fati','Forward', 21, 2);
INSERT INTO Players (name, position, age, Team_ID) VALUES ('Gavi','Midfielder', 19, 2);
INSERT INTO Players (name, position, age, Team_ID) VALUES ('Kroos', 'Midfielder', 21, 3);
INSERT INTO Players (name, position, age, Team_ID)VALUES ('Rudiger','Defender', 28, 3);
INSERT INTO Players (name, position, age, Team_ID) VALUES ('Vini','Forward' 22, 3);
INSERT INTO Players (name, position, age, Team_ID) VALUES ('Modric','Midfielder', 29, 3);
INSERT INTO Players (name, position, age, Team_ID)VALUES ('Rodri', 'Midfielder', 26, 4);
INSERT INTO Players (name, position, age, Team_ID)VALUES ('Haaland','Forward', 20, 4);
INSERT INTO Players (name, position, age, Team_ID) VALUES ('Kdb','Midfielder', 29, 4);

INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (1, 1, 'Monday');
INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (1, 2, 'Monday');
INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (2, 3, 'Tuesday');
INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (2, 4, 'Tuesday');
INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (3, 5, 'Wednesday');
INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (3, 6, 'Wednesday');
INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (4, 1, 'Thursday');
INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (4, 2, 'Thursday');
INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (1, 3, 'Friday');
INSERT INTO Meetings (Team_id, Therapists_ID, day) VALUES (1, 4, 'Friday');

SELECT * FROM Therapists;
SELECT * FROM Team;
SELECT * FROM Meetings;
SELECT * FROM Players;


--createdb nameofdatabase
--psql -d databasename -d filename.sql

/*

-- The names of the players in a given team


SELECT players.name FROM players
INNER JOIN team
ON players.team_id = team.id
WHERE team.id=1;

- - The names & IDs of the therapists working in a given team

SELECT therapists.name,therapists.id FROM therapists
INNER JOIN meetings
ON meetings.therapists_id = therapists.id
WHERE meetings.team_id=1;

-- The names of staff working in enclosures which are closed for maintenance

SELECT therapists.name FROM therapists
INNER JOIN meetings
ON meetings.therapists_id = therapists.id
INNER JOIN team
ON meetings.team_id= team.id
WHERE team.internationalbreak is TRUE;

- The name of the team with the oldes player. If there are two animals who are the same age choose the first one alphabetically.

SELECT team.id FROM players
INNER JOIN team
ON players.team_id = team.id
ORDER BY players.age DESC
LIMIT 1;

- The number of different player positions a given therapist has been assigned to work with.

SELECT COUNT (DISTINCT players.position) FROM players
INNER JOIN team
ON players.team_id = team.id
INNER JOIN meetings
ON meetings.team_id = team.id
WHERE meetings.therapists_id=1;

-- The number of different therapists who have been assigned to work in a given team

SELECT COUNT (DISTINCT therapists.name) FROM therapists
INNER JOIN meetings
ON meetings.therapists_id = therapists.id
WHERE meetings.team_id=1;

- The names of the other players sharing an team with a given player (eg. find the names of all the players in the chelsea with mount)

SELECT teammates.name FROM players
INNER JOIN team
ON players.team_id = team.id
INNER JOIN players AS teammates
ON team.id = teammates.team_id
WHERE players.id = 1;


*/
