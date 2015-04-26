psql

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE section (id SERIAL PRIMARY KEY);

CREATE TABLE employee (id SERIAL PRIMARY KEY, section_id INTEGER REFERENCES section(id));

CREATE TABLE table (
  id SERIAL PRIMARY KEY,
  section_id INTEGER REFERENCES section(id),
  employee_id INTEGER REFERENCES employee(id),
  active_status BOOLEAN
  );

CREATE TABLE seat (id SERIAL PRIMARY KEY, table_id INTEGER REFERENCES table(id));

CREATE TABLE party (
  id SERIAL PRIMARY KEY,
  party_name VARCHAR(80),
  party_size INTEGER,
  table_id INTEGER REFERENCES table(id),
  paid_status BOOLEAN
  );

CREATE TABLE guest (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25),
  seat_id INTEGER REFERENCES seat(id),
  party_id INTEGER REFERENCES party(id),
  dietary_restriction INTEGER REFERENCES restriction(id)
);

CREATE TABLE restriction (id SERIAL PRIMARY KEY, description VARCHAR (255));

CREATE TABLE request(
  id SERIAL PRIMARY KEY,
  item_id INTEGER REFERENCES menu_item(id),
  guest_id INTEGER REFERENCES guest(id),
  order_id INTEGER REFERENCES order(id),
  description VARCHAR(255)
);

CREATE TABLE menu_item(
  id SERIAL PRIMARY KEY,
  description VARCHAR(255),
  cost NUMERIC(10,2),
  restriction_id INTEGER REFERENCES restriction(id)
);

CREATE TABLE order(
  id SERIAL PRIMARY KEY,
  guest_id INTEGER REFERENCES guest(id),
  total_id INTEGER REFERENCES meal_total(id),
  bill_id INTEGER REFERENCES bill(id),
);

CREATE TABLE meal_total(
  id SERIAL PRIMARY KEY,
  party_id INTEGER REFERENCES party(id),
  table_id INTEGER REFERENCES table(id),
);

CREATE TABLE bill(
  id SERIAL PRIMARY KEY,
  guest_id INTEGER REFERENCES guest(id),
  total_id INTEGER REFERENCES meal_total(id),
  bill_id INTEGER REFERENCES bill(id),
  order_id INTEGER REFERENCES order(id),
  party_id INTEGER REFERENCES party(id),
  table_id INTEGER REFERENCES table(id),
  current_timestamp
);
