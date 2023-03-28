SELECT * FROM animals WHERE RIGHT(name, 3) = 'mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;

UPDATE animals
SET species = 'digimon'
WHERE RIGHT(name, 3) = 'mon';

UPDATE animals
SET species = 'pokemon'
WHERE RIGHT(name, 3) != 'mon';

DELETE FROM ANIMALS;

ROLLBACK;

DELETE FROM ANIMALS
WHERE date_of_birth > '2022-01-01';

UPDATE animals
SET weight_kg = weight_kg * -1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;