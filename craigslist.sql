DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL UNIQUE
);

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL UNIQUE
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    fullname TEXT NOT NULL UNIQUE,
    preferred_region  INTEGER REFERENCES regions
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    body TEXT,
    category_id INTEGER REFERENCES categories,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions
);

INSERT INTO regions (region)
VALUES ('San Francisco'), ('Miami'), ('New York'), ('Atlanta'), ('Seattle');

INSERT INTO categories (category)
VALUES ('books'), ('property'), ('cats'), ('free'), ('rent');

INSERT INTO users (fullname) 
VALUES ('Ana Dbui'), ('Mark GIjl'), ('Ben Kgyug'), ('John Lhuy');

INSERT INTO posts (title, body, category_id, User_id, region_id)
VALUES ('Alice in Wonderland', 'HVUY hjgluf hyfuylb hjfy jhfyu', 2, 2,3),
       ('2bdr apt', 'Jnkjdsbkjb jgjbud sdjfd csdjfugsjbc duifse', 1, 1, 1);

