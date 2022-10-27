DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team TEXT NOT NULL UNIQUE
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    player TEXT NOT NULL UNIQUE,
    team_id TEXT NOT NULL REFERENCES teams(team)
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team_1 TEXT NOT NULL REFERENCES teams(team),
    team_2 TEXT NOT NULL REFERENCES teams(team),  
    game_date DATE NOT NULL,
    winner TEXT REFERENCES teams(team)
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER NOT NULL REFERENCES matches,
    player_id INTEGER NOT NULL REFERENCES players
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    referee TEXT NOT NULL UNIQUE
);

CREATE TABLE referee_match
(  
    match_id INTEGER NOT NULL REFERENCES matches,
    referee_id INTEGER NOT NULL REFERENCES referees
);

INSERT INTO teams (team)
VALUES ('PHI'),
       ('MON'),
       ('NYC'),
       ('CIC'),
       ('CHA'),
       ('CHI'),
       ('COL');

INSERT INTO PLAYERS (player, team_id)
VALUES ('Vasya BOkpok', 'COL'),
       ('Makr HJi', 'CHI'),
       ('MAX JIoygg', 'PHI'),
       ('Luke Klio', 'COL'),
       ('Mike Guk', 'PHI');

INSERT INTO referees (referee)
VALUES ('Alina Kisdb'),
       ('Vasya LJibib'),
       ('Nick FUYF'),
       ('Serge LIohh');

INSERT INTO matches (team_1, team_2, game_date, winner)
VALUES ('PHI', 'CIC', '2011-09-03', 'PHI'),
       ('COL', 'PHI', '2021-09-12', 'COL'),
       ('CHI', 'NYC', '2013-03-03', 'CHA');

INSERT INTO goals (match_id, player_id)
VALUES (1, 1),
       (2,2),
       (2,1),
       (3,2);

INSERT INTO referee_match (match_id, referee_id)
VALUES  (2,2),
       (2,1),
       (3,2);

-- STANDING/RANKING
SELECT winner, COUNT(winner) FROM matches GROUP BY winner ORDER BY count(winner) DESC;