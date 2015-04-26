psql

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE parties (
  id SERIAL PRIMARY KEY,
  party_name VARCHAR(80),
  party_size INTEGER,
  paid_status BOOLEAN
);

CREATE TABLE guests (id SERIAL PRIMARY KEY,   party_id INTEGER REFERENCES parties(id));


CREATE TABLE items(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  price NUMERIC(10,2),
  restriction BOOLEAN
);


CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  guest_id INTEGER REFERENCES guests(id),
  party_id INTEGER REFERENCES parties(id),
  total INTEGER,
  paid BOOLEAN
);

CREATE TABLE request (
  id SERIAL PRIMARY KEY,
  item_id INTEGER REFERENCES items(id),
  guest_id INTEGER REFERENCES guests(id),
  order_id INTEGER REFERENCES orders(id)
);
