DROP TABLE fitness_class;
DROP TABLE customers;
DROP TABLE instructors;

CREATE TABLE customers
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255)
);

CREATE TABLE instructors
(
  id SERIAL primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255)
);

CREATE TABLE fitness_class
(
  id SERIAL primary key,
  customer_id INT references customers(id),
  instructor_id INT references instructors(id)
);
