/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id int GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg float,
    species VARCHAR(100),
    PRIMARY KEY(id)
    );

 
