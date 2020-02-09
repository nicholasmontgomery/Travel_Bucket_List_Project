DROP TABLE visits;
DROP TABLE sights;
DROP TABLE cities;
DROP TABLE countries;
DROP TABLE continents;

CREATE TABLE continents (
  id SERIAL PRIMARY key,
  name varchar(255)
);

CREATE TABLE countries (
  id SERIAL PRIMARY key,
  name varchar(255),
  continent_id INT REFERENCES continents(id) NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY key,
  name varchar(255),
  country_id INT REFERENCES countries(id) NOT NULL
);

CREATE TABLE sights (
  id SERIAL PRIMARY key,
  name varchar(255),
  city_id INT REFERENCES cities(id) NOT NULL
);

CREATE TABLE visits (
  id SERIAL PRIMARY key,
  date varchar(255),
  url(TEXT),
  sight_id INT REFERENCES sightss(id) NOT NULL,
  city_id INT REFERENCES cities(id) NOT NULL
);
