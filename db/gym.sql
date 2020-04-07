DROP TABLE bookings;
DROP TABLE fitness_class;
DROP TABLE customers;


CREATE TABLE customers
(
  id SERIAL primary key,
  first_name VARCHAR(255) not null,
  last_name VARCHAR(255),
  age INT,
  gender VARCHAR(255)
);

CREATE TABLE fitness_class
(
  id SERIAL primary key,
  lesson_name VARCHAR(255)
);

CREATE TABLE bookings
(
  id SERIAL primary key,
  customer_id INT references customers(id),
  fitness_id INT references fitness_class(id)
);
