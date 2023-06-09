SELECT * FROM animals WHERE RIGHT(name, 3) = 'mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE RIGHT(name, 3) = 'mon';

UPDATE animals
SET species = 'pokemon'
WHERE RIGHT(name, 3) != 'mon';

COMMIT;

BEGIN TRANSACTION;

DELETE FROM ANIMALS;

ROLLBACK;

DELETE FROM ANIMALS
WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO SP1;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(*) FROM animals;

SELECT 
COUNT(*)
FROM 
animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT
neutered, SUM(escape_attempts)
FROM
animals
GROUP BY neutered;

SELECT
species, MIN(weight_kg), MAX(weight_kg)
FROM
animals
GROUP BY species;

SELECT
species, AVG(escape_attempts)
FROM
animals 
WHERE 
date_of_birth BETWEEN '1990-01-01' AND  '2000-12-31'
GROUP BY species;

SELECT * FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';

SELECT * FROM animals a INNER JOIN species s ON a.species_id = s.id WHERE s.name = 'Pokemon';


SELECT * FROM owners o FULL OUTER JOIN animals a ON o.id = a.owner_id;

SELECT s.name, COUNT(*) FROM species s LEFT JOIN animals a ON s.id =  a.species_id GROUP BY s.name;

SELECT * FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Jennifer Orwell'
AND a.species_id = (SELECT id from species WHERE name = 'Digimon');

SELECT * FROM animals a INNER JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts <= 0;

SELECT o.full_name, COUNT(*) FROM owners o LEFT JOIN animals a ON o.id =  a.owner_id GROUP BY o.full_name ORDER BY COUNT DESC LIMIT 1;

-- Milestone 4
SELECT * FROM animals
INNER JOIN visits on visits.animals_id = animals.id
INNER JOIN vets on vets.id = visits.vets_id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC
LIMIT 1;


SELECT DISTINCT   *  FROM animals 
INNER JOIN visits ON visits.animals_id=animals.id
INNER JOIN vets ON vets.id=visits.vets_id
where  vets.name ='Stephanie Mendez';

SELECT * from vets 
LEFT JOIN specializations ON specializations.vets_id=vets.id
LEFT JOIN species ON species.id =specializations.species_id;


SELECT  *  FROM animals 
INNER JOIN visits ON visits.animals_id=animals.id
INNER JOIN vets ON vets.id=visits.vets_id
WHERE  vets.name ='Stephanie Mendez' AND date_of_visit BETWEEN '2020-04-01' AND '2020-04-30';


SELECT  animals.name AS animal_name, count( animals.name) as number_of_visited FROM animals 
INNER JOIN visits ON visits.animals_id=animals.id
INNER JOIN vets ON vets.id=visits.vets_id
GROUP BY animals.name 
ORDER BY  number_of_visited DESC;


SELECT  *  FROM animals 
INNER JOIN visits ON visits.animals_id=animals.id
INNER JOIN vets ON vets.id=visits.vets_id
WHERE  vets.name ='Maisy Smith'
ORDER BY date_of_visit ASC
LIMIT 1;

select  *  from animals 
inner join visits on visits.animals_id=animals.id
inner join vets on vets.id=visits.vets_id
order by date_of_visit desc
limit 1;


select  count(visits.id) as number_of_vists  from animals
inner join visits on visits.animals_id =animals.id
inner join vets on vets.id=visits.vets_id
left join specializations on specializations.vets_id=vets.id
where specializations.species_id is  null;


select species.name, count(species.name)  as number_vists_by_Maisy_Smith from animals
inner join visits on visits.animals_id =animals.id
inner join species on species.id =animals.species_id 
inner join vets on vets.id=visits.vets_id
left join specializations on specializations.vets_id=vets.id
where vets.name ='Maisy Smith'
group by species.name;