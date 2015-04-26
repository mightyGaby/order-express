psql

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE party (
  id SERIAL PRIMARY KEY,
  party_name VARCHAR(80),
  party_size INTEGER,
  paid_status BOOLEAN
);

CREATE TABLE guest (id SERIAL PRIMARY KEY,   party_id INTEGER REFERENCES party(id));

CREATE TABLE category (id SERIAL PRIMARY KEY, description VARCHAR(255));

CREATE TABLE menu_item(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  cost NUMERIC(10,2),
  restriction BOOLEAN,
  category_id INTEGER REFERENCES category(id)
);


CREATE TABLE ordr (
  id SERIAL PRIMARY KEY,
  guest_id INTEGER REFERENCES guest(id),
  party_id INTEGER REFERENCES party(id)
);

CREATE TABLE request (
  id SERIAL PRIMARY KEY,
  item_id INTEGER REFERENCES menu_item(id),
  guest_id INTEGER REFERENCES guest(id),
  order_id INTEGER REFERENCES ordr(id)
);
