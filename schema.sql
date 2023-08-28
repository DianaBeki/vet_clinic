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

CREATE TABLE owners(
    id int GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR,
    age int,
    PRIMARY KEY(id)
    );

CREATE TABLE species(
    id int GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    PRIMARY KEY(id)
    );
ALTER TABLE animals  DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);
 
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
 CREATE INDEX visit_animal_id_idx ON visits (animal_id);
CREATE INDEX owners_email_idx ON owners (email);
CREATE INDEX vet_id_idx ON visits (vet_id);