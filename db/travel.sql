DROP TABLE visits;
DROP TABLE cities;
DROP TABLE countries;
DROP TABLE continents;

CREATE TABLE continents (
  id SERIAL PRIMARY key,
  name varchar(255),
  visited boolean
);

CREATE TABLE countries (
  id SERIAL PRIMARY key,
  name varchar(255),
  visited boolean,
  continent_id INT REFERENCES continents(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY key,
  name varchar(255),
  visited boolean,
  country_id INT REFERENCES countries(id) ON DELETE CASCADE NOT NULL
);

CREATE TABLE visits (
  id SERIAL PRIMARY key,
  visit_date varchar(255),
  url text,
  comment text,
  city_id INT REFERENCES cities(id) ON DELETE CASCADE NOT NULL
);
