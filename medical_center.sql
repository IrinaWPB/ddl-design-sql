-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    fullname TEXT NOT NULL UNIQUE
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    fullname TEXT NOT NULL UNIQUE
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL UNIQUE
);

CREATE TABLE med_center_visit
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients,
    diagnosis INTEGER REFERENCES diseases
);


