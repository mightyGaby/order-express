psql

CREATE DATABASE restaurant;

\c restaurant;

CREATE TABLE section (id SERIAL PRIMARY KEY);

CREATE TABLE employee (id SERIAL PRIMARY KEY, section_id INTEGER REFERENCES section(id));

CREATE TABLE tbl (
  id SERIAL PRIMARY KEY,
  section_id INTEGER REFERENCES section(id),
  employee_id INTEGER REFERENCES employee(id),
  active_status BOOLEAN
  );

CREATE TABLE seat (id SERIAL PRIMARY KEY, tbl_id INTEGER REFERENCES tbl(id));

CREATE TABLE party (
  id SERIAL PRIMARY KEY,
  party_name VARCHAR(80),
  party_size INTEGER,
  tbl_id INTEGER REFERENCES tbl(id),
  paid_status BOOLEAN
  );

CREATE TABLE restriction (id SERIAL PRIMARY KEY, description VARCHAR (255));

CREATE TABLE guest (
  id SERIAL PRIMARY KEY,
  name VARCHAR(25),
  seat_id INTEGER REFERENCES seat(id),
  party_id INTEGER REFERENCES party(id),
  dietary_restriction INTEGER REFERENCES restriction(id)
);

CREATE TABLE menu_item(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  cost NUMERIC(10,2),
  restriction_id INTEGER REFERENCES restriction(id)
);

CREATE TABLE meal_total(
  id SERIAL PRIMARY KEY,
  party_id INTEGER REFERENCES party(id),
  tbl_id INTEGER REFERENCES tbl(id)
);

CREATE TABLE ordr (
  id SERIAL PRIMARY KEY,
  guest_id INTEGER REFERENCES guest(id),
  total_id INTEGER REFERENCES meal_total(id),
  party_id INTEGER REFERENCES party(id)
);

CREATE TABLE item_request(
  id SERIAL PRIMARY KEY,
  item_id INTEGER REFERENCES menu_item(id),
  guest_id INTEGER REFERENCES guest(id),
  ordr_id INTEGER REFERENCES ordr(id),
  description TEXT
);



CREATE TABLE bill(
  id SERIAL PRIMARY KEY,
  guest_id INTEGER REFERENCES guest(id),
  total_id INTEGER REFERENCES meal_total(id),
  ordr_id INTEGER REFERENCES ordr(id),
  party_id INTEGER REFERENCES party(id),
  tbl_id INTEGER REFERENCES tbl(id)
);
