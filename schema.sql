DROP TABLE locations, weathers, yelps, movies, meetups, trails;

CREATE TABLE IF NOT EXISTS locations ( 
  id SERIAL PRIMARY KEY, 
  search_query VARCHAR(255), 
  formatted_query VARCHAR(255), 
  latitude NUMERIC(8, 6), 
  longitude NUMERIC(9, 6),
  short_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS weathers ( 
  id SERIAL PRIMARY KEY, 
  forecast VARCHAR(255), 
  time VARCHAR(255), 
  location_id INTEGER NOT NULL REFERENCES locations(id) 
);
  
  CREATE TABLE IF NOT EXISTS yelps (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(255), 
  image_url VARCHAR(255), 
  price CHAR(5), 
  rating NUMERIC(2,1), 
  url VARCHAR(255), 
  location_id INTEGER NOT NULL REFERENCES locations(id) 
);
  
CREATE TABLE IF NOT EXISTS movies ( 
  id SERIAL PRIMARY KEY, 
  title VARCHAR(255), 
  overview VARCHAR(1000), 
  average_votes NUMERIC(4,2), 
  total_votes INTEGER, 
  image_url VARCHAR(255), 
  popularity NUMERIC(6,4), 
  released_on CHAR(10), 
  location_id INTEGER NOT NULL REFERENCES locations(id) 
);
  
CREATE TABLE IF NOT EXISTS meetups (
  id SERIAL PRIMARY KEY, 
  link VARCHAR(255), 
  name VARCHAR(255), 
  creation_date VARCHAR(255), 
  host VARCHAR(255), 
  location_id INTEGER NOT NULL REFERENCES locations(id) 
);

CREATE TABLE IF NOT EXISTS trails (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255),
  length NUMERIC (4,2),
  stars NUMERIC (4,2),
  star_votes INTEGER,
  summary TEXT,
  trail_url VARCHAR(255),
  conditions VARCHAR(255),
  condition_date VARCHAR(255),
  condition_time VARCHAR(255),
  location_id INTEGER NOT NULL REFERENCES locations(id) 
)