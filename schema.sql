CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth DATE NOT NULL,
    escape_attempts INT,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL  
);

-- MILESTONE 2

ALTER TABLE animals
ADD COLUMN species VARCHAR;


CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);

-- MILESTONE 3

ALTER TABLE animals DROP CONSTRAINT IF EXISTS animals_pkey;

ALTER TABLE animals
ADD COLUMN id_new SERIAL PRIMARY KEY;

ALTER TABLE animals DROP COLUMN id;

ALTER TABLE animals RENAME COLUMN id_new TO id;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);


-- MILESTONE 4

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  species_id INT REFERENCES species(id),
  vets_id INT REFERENCES vets(id)
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animals_id INTEGER REFERENCES animals(id),
  vets_id INTEGER REFERENCES vets(id),
  date_of_visit DATE
)


CREATE INDEX ON visits (animals_id);

 CREATE INDEX ON owners (email);