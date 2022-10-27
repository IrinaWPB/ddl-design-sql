-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL UNIQUE
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL UNIQUE
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  from_city INTEGER NOT NULL REFERENCES cities,
  from_country INTEGER NOT NULL REFERENCES countries,
  arrival TIMESTAMP NOT NULL,
  to_city INTEGER NOT NULL REFERENCES cities,
  to_country INTEGER NOT NULL REFERENCES countries
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY, 
  first_name TEXT,
  last_name TEXT,
  flight_id INTEGER REFERENCES flights,
  seat_number TEXT
);

INSERT INTO cities (city)
VALUES ('Seattle'),
('London'),
('Mexico City'),
('New York'),
('Moscow'),
('Tokyo'),
('Paris'),
('Dubai'),
('Las Vegas'),
('Washington DC'),
('LOs Angeles'),
('Sao Paolo');

INSERT INTO countries (country)
VALUES('USA'),
('United Kingdom'),
('Russia'),
('FRance'),
('UAE'),
('Brazil'),
('Mexico'),
('Japan');

INSERT INTO flights (airline, departure, from_city, from_country, arrival, to_city, to_country)
VALUES('United', '2018-04-08 09:00:00', 1, 1, '2018-04-08 12:00:00', 2,5),
('American Airlines','2018-12-19 12:45:00', 2, 2,'2018-12-19 16:15:00', 3,4),
('Air China', '2019-02-06 16:28:00',3, 7, '2019-01-20 22:45:00', 4,3);

