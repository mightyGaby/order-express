psql

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE parties (
  id SERIAL PRIMARY KEY,
  name VARCHAR(80),
  size INTEGER,
  status BOOLEAN
);

-- CREATE TABLE guests (id SERIAL PRIMARY KEY,  party_id INTEGER REFERENCES parties(id));


CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  price NUMERIC(10,2),
  restriction BOOLEAN
);


CREATE TABLE orders (s
  id SERIAL PRIMARY KEY,
  party_id INTEGER REFERENCES parties(id),
  paid BOOLEAN,
  seat INTEGER
);

-- CREATE TABLE request (
--   id SERIAL PRIMARY KEY,
--   item_id INTEGER REFERENCES items(id),
--   guest_id INTEGER REFERENCES guests(id),
--   order_id INTEGER REFERENCES orders(id)
-- );
