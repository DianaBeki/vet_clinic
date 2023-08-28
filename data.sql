/* Populate database with sample data. */

INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Gabumon',
'2018-11-15', 2, true, 8.00);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Devimon', '2017-05-12',5, true, 11.00);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Charmander', '2020-02-08', 0, false, -11.00);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Plantmon', '2021-11-15', 2, true, -5.70);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Angemon', '2005-06-12', 1, true, -45.00);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Boarmon', '2005-06-07', 7, true, 20.40);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Blossom', '1998-10-13', 3, true, 17.00);
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES('Ditto', '2022-05-14', 4, true, 22.00);

INSERT INTO owners(full_name,age) VALUES('Sam Smith',34),('Jennifer Orwell',19),('Bob',45),
('Melody Pond',77),('Dean Winchester',14),('Jody Whittaker',38);
INSERT INTO species(name) VALUES('Pokemon'),('Digimon');

UPDATE animals SET species_id = s.id FROM species s 
WHERE (animals.name LIKE '%mon' AND s.name = 'Digimon') OR (animals.name NOT LIKE '%mon' AND s.name = 'Pokemon');

UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Agumon' AND o.full_name = 'Sam Smith';
UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Pikachu' AND o.full_name = 'Jennifer Orwell';
UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Gabumon' AND o.full_name = 'Jennifer Orwell';
UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Devimon' AND o.full_name = 'Bob';
UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Plantmon' AND o.full_name = 'Bob';
UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Charmander' AND o.full_name = 'Melody Pond';
UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Squirtle' AND o.full_name = 'Melody Pond';
UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Blossom' AND o.full_name = 'Melody Pond';
UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Angemon' AND o.full_name = 'Dean Winchester';
UPDATE animals SET owner_id = o.id FROM owners o WHERE animals.name = 'Boarmon' AND o.full_name = 'Dean Winchester';

-- Day 5
INSERT INTO visits (animal_id, vet_id, date_of_visit)
 SELECT * FROM (SELECT id FROM animals) animal_ids,
  (SELECT id FROM vets) 
  vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours')
   visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
