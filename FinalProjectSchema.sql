--Mitchell's contributions
DROP TABLE player CASCADE CONSTRAINTS;
CREATE TABLE player (
    playerid        char(9),
    fname           varchar2(15) not null,
    lname           varchar2(15) not null,
    weight          number(3), --pounds
    height          number(2), --inches
    hometown        varchar2(15),
    age             number(2),
    school          varchar2(15),
    primary key     (playerid)
    --foreign key   (school) references team(school)
);

DROP TABLE team CASCADE CONSTRAINTS;
CREATE TABLE team (
    school      varchar2(15),
    mascot      varchar2(15),
    prevyrfinal char(4),
    coach       varchar2(15),
    city        varchar2(15),
    noplayers   number(2),
    primary key (school)
);

ALTER TABLE player ADD (
  foreign key (school) references team(school)
);

DROP TABLE standings CASCADE CONSTRAINTS;
CREATE TABLE standings (
    ranking     number(2),
    notitles    number(2),
    wins        number(2),
    losses      number(2),
    draws       number(2),
    school      varchar2(15),
    primary key (ranking),
    foreign key (school) references team(school)
);

DROP TABLE games CASCADE CONSTRAINTS;
CREATE TABLE games (
    winner      varchar2(15),
    gamedate    date,
    hometeam    varchar2(15),
    awayteam    varchar2(15),
    homescore   number(2),
    awayscore   number(2),
    primary key (winner, gamedate),
    foreign key (winner) references team(school)
);

DROP TABLE playerstats CASCADE CONSTRAINTS;
CREATE TABLE playerstats (
    playerid        char(9),
    playerno        number(2),
    yellowcards     number(1),
    redcards        number(1),
    assists         number(2),
    goals           number(2),
    primary key     (playerid, playerno),
    foreign key     (playerid) references player(playerid)
);

--Triggers to update number of players on divisional teams
--DROP TRIGGER VillanovaNoPlayers;
CREATE TRIGGER VillanovaNoPlayers
AFTER UPDATE ON player
BEGIN    
    UPDATE team SET noplayers = (SELECT count(*) FROM player WHERE school = 'Villanova') WHERE school = 'Villanova';
END;

--DROP TRIGGER TempleNoPlayers;
CREATE TRIGGER TempleNoPlayers
AFTER UPDATE ON player
BEGIN    
    UPDATE team SET noplayers = (SELECT count(*) FROM player WHERE school = 'Temple') WHERE school = 'Temple';
END;

--DROP TRIGGER StJosephsNoPlayers;
CREATE TRIGGER StJosephsNoPlayers
AFTER UPDATE ON player
BEGIN    
    UPDATE team SET noplayers = (SELECT count(*) FROM player WHERE school = 'St. Josephs') WHERE school = 'St. Josephs';
END;

--DROP TRIGGER DrexelNoPlayers;
CREATE TRIGGER DrexelNoPlayers
AFTER UPDATE ON player
BEGIN    
    UPDATE team SET noplayers = (SELECT count(*) FROM player WHERE school = 'Drexel') WHERE school = 'Drexel';
END;

--Villanova
INSERT INTO player VALUES ('000000001', 'John', 'Smith', 180, 72, 'Philadelphia', 19, null);
INSERT INTO player VALUES ('000000002', 'Joe', 'Doe', 190, 74, 'Scranton', 20, null);
INSERT INTO player VALUES ('000000003', 'Joseph', 'Grant', 170, 70, 'Bethlehem', 21, null);
INSERT INTO player VALUES ('000000004', 'Zach', 'Clyde', 180, 71, 'New Orleans', 22, null);
INSERT INTO player VALUES ('000000005', 'Michael', 'Bunt', 170, 69, 'Queens', 18, null);
INSERT INTO player VALUES ('000000006', 'Tyler', 'Dinckinson', 175, 68, 'Houston', 21, null);
INSERT INTO player VALUES ('000000007', 'Josh', 'Johnson', 195, 74, 'Bronx', 22, null);
INSERT INTO player VALUES ('000000008', 'Brendan', 'Williams', 200, 75, 'Orlando', 20, null);
INSERT INTO player VALUES ('000000009', 'Jason', 'Brown', 185, 71, 'Los Angeles', 21, null);
INSERT INTO player VALUES ('000000010', 'Jay', 'Jones', 180, 72, 'Las Vegas', 19, null);
INSERT INTO player VALUES ('000000011', 'Nicholas', 'Miller', 190, 74, 'Phoenix', 20, null);

--Temple
INSERT INTO player VALUES ('000000012', 'Nick', 'Grant', 170, 70, 'Lincoln', 21, null);
INSERT INTO player VALUES ('000000013', 'Theo', 'Davis', 180, 72, 'Chicago', 19, null);
INSERT INTO player VALUES ('000000014', 'Peter', 'Garcia', 190, 74, 'Detroit', 20, null);
INSERT INTO player VALUES ('000000015', 'Jake', 'Rodriguez', 170, 70, 'Pittsburgh', 21, null);
INSERT INTO player VALUES ('000000016', 'Jacob', 'Wilson', 180, 72, 'Allentown', 19, null);
INSERT INTO player VALUES ('000000017', 'Alex', 'Martinez', 190, 74, 'Nazareth', 20, null);
INSERT INTO player VALUES ('000000018', 'Jarvis', 'Anderson', 170, 70, 'Easton', 21, null);
INSERT INTO player VALUES ('000000019', 'Brian', 'Silva', 185, 71, 'York', 18, null);
INSERT INTO player VALUES ('000000020', 'Jackson', 'Taylor', 195, 73, 'Malvern', 19, null);
INSERT INTO player VALUES ('000000021', 'Andrew', 'Thomas', 160, 67, 'Wildwood', 20, null);
INSERT INTO player VALUES ('000000022', 'Ryan', 'Hernandez', 165, 68, 'Baltimore', 21, null);

--St. Josephs
INSERT INTO player VALUES ('000000023', 'Ethan', 'Moore', 170, 70, 'Austin', 22, null);
INSERT INTO player VALUES ('000000024', 'Simon', 'Thompson', 180, 71, 'Harrisburg', 21, null);
INSERT INTO player VALUES ('000000025', 'Henry', 'White', 190, 72, 'Louisville', 20, null);
INSERT INTO player VALUES ('000000026', 'Edward', 'Lopez', 185, 73, 'Nashville', 20, null);
INSERT INTO player VALUES ('000000027', 'David', 'Lee', 180, 71, 'Radnor', 21, null);
INSERT INTO player VALUES ('000000028', 'Liam', 'Gonzalez', 180, 71, 'Philadelphia', 20, null);
INSERT INTO player VALUES ('000000029', 'Phillip', 'Harris', 200, 74, 'Kutztown', 18, null);
INSERT INTO player VALUES ('000000030', 'Carl', 'Clark', 155, 69, 'Reading', 20, null);
INSERT INTO player VALUES ('000000031', 'Mike', 'Lewis', 170, 70, 'Loyola', 21, null);
INSERT INTO player VALUES ('000000032', 'Samuel', 'Robinson', 165, 70, 'Scranton', 21, null);
INSERT INTO player VALUES ('000000033', 'Mitchell', 'Gallagher', 175, 71, 'Cincinnati', 21, null);

--Drexel
INSERT INTO player VALUES ('000000034', 'Malachi', 'Walker', 185, 73, 'Venice', 22, null);
INSERT INTO player VALUES ('000000035', 'Moses', 'Perez', 195, 75, 'Queens', 19, null);
INSERT INTO player VALUES ('000000036', 'Bryan', 'Hall', 170, 72, 'Manhattan', 19, null);
INSERT INTO player VALUES ('000000037', 'Anthony', 'Smith', 185, 74, 'Nazareth', 22, null);
INSERT INTO player VALUES ('000000038', 'Tony', 'Rock', 190, 74, 'Easton', 19, null);
INSERT INTO player VALUES ('000000039', 'Terrece', 'Black', 180, 73, 'Pottstown', 19, null);
INSERT INTO player VALUES ('000000040', 'Walter', 'Jones', 175, 72, 'Paoli', 22, null);
INSERT INTO player VALUES ('000000041', 'Junior', 'Gregory', 185, 73, 'Havertown', 19, null);
INSERT INTO player VALUES ('000000042', 'Will', 'Lee', 195, 75, 'Bronx', 19, null);
INSERT INTO player VALUES ('000000043', 'Chris', 'Wang', 180, 71, 'Manhattan', 22, null);
INSERT INTO player VALUES ('000000044', 'Adam', 'Banner', 190, 74, 'West Chester', 19, null);

INSERT INTO team VALUES ('Villanova', 'Wildcats', '2018', 'Neptune', 'Villanova', null);
INSERT INTO team VALUES ('Temple', 'Owls', null, 'Gallagher', 'Philadelphia', null);
INSERT INTO team VALUES ('St. Josephs', 'Hawks', '1998', 'White', 'Philadelphia', null);
INSERT INTO team VALUES ('Drexel', 'Dragons', '2004', 'Jones', 'Philadelphia', null);

SELECT * FROM team; --Make sure noplayers are null before updating player.school

UPDATE player SET school = 'Villanova' WHERE playerid = '000000001';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000002';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000003';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000004';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000005';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000006';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000007';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000008';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000009';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000010';
UPDATE player SET school = 'Villanova' WHERE playerid = '000000011';

UPDATE player SET school = 'Temple' WHERE playerid = '000000012';
UPDATE player SET school = 'Temple' WHERE playerid = '000000013';
UPDATE player SET school = 'Temple' WHERE playerid = '000000014';
UPDATE player SET school = 'Temple' WHERE playerid = '000000015';
UPDATE player SET school = 'Temple' WHERE playerid = '000000016';
UPDATE player SET school = 'Temple' WHERE playerid = '000000017';
UPDATE player SET school = 'Temple' WHERE playerid = '000000018';
UPDATE player SET school = 'Temple' WHERE playerid = '000000019';
UPDATE player SET school = 'Temple' WHERE playerid = '000000020';
UPDATE player SET school = 'Temple' WHERE playerid = '000000021';
UPDATE player SET school = 'Temple' WHERE playerid = '000000022';

UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000023';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000024';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000025';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000026';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000027';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000028';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000029';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000030';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000031';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000032';
UPDATE player SET school = 'St. Josephs' WHERE playerid = '000000033';

UPDATE player SET school = 'Drexel' WHERE playerid = '000000034';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000035';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000036';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000037';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000038';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000039';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000040';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000041';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000042';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000043';
UPDATE player SET school = 'Drexel' WHERE playerid = '000000044';

INSERT INTO standings VALUES (1, 3, 3, 0, 0, 'Villanova');
INSERT INTO standings VALUES (3, 0, 1, 2, 0, 'Temple');
INSERT INTO standings VALUES (2, 2, 2, 1, 0, 'St. Josephs');
INSERT INTO standings VALUES (4, 1, 0, 3, 0, 'Drexel');

INSERT INTO games VALUES ('Villanova', '01-OCT-2022', 'Villanova', 'Temple', 2, 1);
INSERT INTO games VALUES ('Villanova', '08-OCT-2022', 'Villanova', 'St. Josephs', 4, 1);
INSERT INTO games VALUES ('Villanova', '15-OCT-2022', 'Drexel', 'Villanova', 0, 3);
INSERT INTO games VALUES ('St. Josephs', '05-OCT-2022', 'Temple', 'St. Josephs', 3, 4);
INSERT INTO games VALUES ('St. Josephs', '13-OCT-2022', 'St. Josephs', 'Drexel', 4, 3);
INSERT INTO games VALUES ('Temple', '10-OCT-2022', 'Temple', 'Drexel', 2, 0);

--Villanova
INSERT INTO playerstats VALUES ('000000001', 3, 2, 1, 0, 3);
INSERT INTO playerstats VALUES ('000000002', 16, 1, 0, 2, 1);
INSERT INTO playerstats VALUES ('000000003', 27, 3, 2, 1, 1);
INSERT INTO playerstats VALUES ('000000004', 4, 0, 0, 2, 1);
INSERT INTO playerstats VALUES ('000000005', 9, 1, 0, 1, 1);
INSERT INTO playerstats VALUES ('000000006', 5, 2, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000007', 18, 2, 1, 0, 0);
INSERT INTO playerstats VALUES ('000000008', 21, 3, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000009', 13, 0, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000010', 22, 3, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000011', 1, 0, 0, 0, 0);

--Temple
INSERT INTO playerstats VALUES ('000000012', 2, 3, 2, 1, 2);
INSERT INTO playerstats VALUES ('000000013', 15, 2, 1, 2, 2);
INSERT INTO playerstats VALUES ('000000014', 26, 2, 1, 2, 2);
INSERT INTO playerstats VALUES ('000000015', 3, 1, 0, 1, 1);
INSERT INTO playerstats VALUES ('000000016', 8, 1, 0, 1, 0);
INSERT INTO playerstats VALUES ('000000017', 4, 2, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000018', 17, 2, 1, 0, 0);
INSERT INTO playerstats VALUES ('000000019', 20, 3, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000020', 12, 0, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000021', 7, 0, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000022', 16, 0, 0, 0, 0);

--St. Josephs
INSERT INTO playerstats VALUES ('000000023', 5, 2, 1, 4, 2);
INSERT INTO playerstats VALUES ('000000024', 18, 1, 0, 3, 2);
INSERT INTO playerstats VALUES ('000000025', 29, 3, 2, 1, 3);
INSERT INTO playerstats VALUES ('000000026', 6, 0, 0, 1, 2);
INSERT INTO playerstats VALUES ('000000027', 11, 1, 0, 0, 2);
INSERT INTO playerstats VALUES ('000000028', 7, 2, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000029', 20, 2, 1, 0, 0);
INSERT INTO playerstats VALUES ('000000030', 23, 3, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000031', 1, 0, 0, 0, 1);
INSERT INTO playerstats VALUES ('000000032', 2, 0, 0, 0, 1);
INSERT INTO playerstats VALUES ('000000033', 4, 0, 0, 0, 1);

--Drexel
INSERT INTO playerstats VALUES ('000000034', 2, 2, 1, 1, 1);
INSERT INTO playerstats VALUES ('000000035', 23, 1, 0, 1, 2);
INSERT INTO playerstats VALUES ('000000036', 29, 2, 2, 1, 0);
INSERT INTO playerstats VALUES ('000000037', 6, 0, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000038', 12, 1, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000039', 8, 2, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000040', 19, 2, 1, 0, 0);
INSERT INTO playerstats VALUES ('000000041', 13, 3, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000042', 15, 0, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000043', 2, 3, 0, 0, 0);
INSERT INTO playerstats VALUES ('000000044', 11, 0, 0, 0, 0);

--SELECT * FROM player;
SELECT * FROM team; --make sure noplayers is updated
--SELECT * FROM standings ORDER BY ranking;
--SELECT * FROM games;
--SELECT * FROM playerstats;

--Jason's contributions
--Goals and Assists per game by player
SELECT school, fname, lname, (goals+assists)/(wins+losses+draws) AS goals_assists_per_game
FROM player NATURAL JOIN standings NATURAL JOIN playerstats
WHERE goals+assists > 0
ORDER BY goals_assists_per_game DESC;

--Cards Per Game by School
DROP VIEW School_Fair_Play;
CREATE VIEW School_Fair_Play
AS SELECT school, (sum(yellowcards)+sum(redcards))/(avg(wins)+avg(losses)+avg(draws)) AS cards_per_game
FROM player NATURAL JOIN standings NATURAL JOIN playerstats GROUP BY school
ORDER BY cards_per_game DESC;

SELECT * FROM School_Fair_Play;

--Rankings as compared to cards
DROP VIEW Ranking_vs_Fair_Play;
CREATE VIEW Ranking_vs_Fair_Play
AS SELECT school, ranking, cards_per_game
FROM standings NATURAL JOIN School_Fair_Play;

SELECT * FROM Ranking_vs_Fair_Play;

--Wins By Coach
DROP VIEW Coach_Wins;
CREATE VIEW Coach_Wins
AS SELECT coach, COUNT(coach) AS wins 
FROM games LEFT JOIN team ON winner = school GROUP BY coach;

SELECT * FROM Coach_Wins;

--Goals given up
DROP VIEW Goals_Against_Home;
CREATE VIEW Goals_Against_Home
AS SELECT hometeam, sum(awayscore) AS goals_against_home
FROM games GROUP BY hometeam;

SELECT * FROM Goals_Against_Home;

DROP VIEW Goals_Against_Away;
CREATE VIEW Goals_Against_Away
AS SELECT awayteam, sum(homescore) AS goals_against_away
FROM games GROUP BY awayteam;

SELECT * FROM Goals_Against_Away;

DROP VIEW Total_Goals_Against;
CREATE VIEW Total_Goals_Against
AS SELECT hometeam as school, goals_against_away+goals_against_home as goals_against
FROM Goals_Against_Home FULL JOIN Goals_Against_Away ON hometeam = awayteam;

SELECT * FROM Total_Goals_Against;

--Goals given up
DROP VIEW Goals_for_Home;
CREATE VIEW Goals_for_Home
AS SELECT hometeam, sum(homescore) AS goals_for_home
FROM games GROUP BY hometeam;

SELECT * FROM Goals_for_Home;

DROP VIEW Goals_for_Away;
CREATE VIEW Goals_for_Away
AS SELECT awayteam, sum(awayscore) AS goals_for_away
FROM games GROUP BY awayteam;

SELECT * FROM Goals_for_Home;

DROP VIEW Total_Goals_for;
CREATE VIEW Total_Goals_for
AS SELECT hometeam as school, goals_for_away+goals_for_home as goals_for
FROM Goals_for_Home FULL JOIN Goals_for_Away ON hometeam = awayteam;

SELECT * FROM Total_Goals_for;

--Rankings Compared to Goal Statistics
SELECT school, ranking, goals_for, goals_against
FROM standings NATURAL JOIN Total_Goals_for NATURAL JOIN  Total_Goals_Against
ORDER BY ranking;

SELECT * FROM Coach_Wins;

--Jack Contributions

--Players averaging 1 or more point per game for the season
SELECT school, fname, lname, (goals+assists)/(wins+losses+draws) AS points_per_game
FROM player NATURAL JOIN standings NATURAL JOIN playerstats
WHERE (goals+assists)/(wins+losses+draws) >= 1
ORDER BY points_per_game DESC;

--Teams that have a record above .500 on the season
SELECT school, (wins/(wins+losses)) AS team_record
FROM standings
WHERE (wins/(wins+losses)) >= .5
ORDER BY team_record DESC;

--Average age on Drexel's team
SELECT AVG(age)
FROM player
WHERE school = 'Drexel';

--What percentage of Villanova's goals are assisted?
SELECT SUM(assists)/SUM(goals)*100 AS percentage_of_goals_assisted
FROM player NATURAL JOIN playerstats
WHERE school = 'Villanova';

--Nested Queries
--Players that have more than 3 cards on the season
SELECT fname, lname, school FROM player P where EXISTS
(SELECT * FROM playerstats PS where P.playerid=PS.playerid and (PS.yellowcards + PS.redcards > 3) );

--Players that have more assists than goals
SELECT fname, lname, school FROM player WHERE playerid IN
(SELECT playerid FROM playerstats where assists>goals);
