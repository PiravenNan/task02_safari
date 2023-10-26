DROP TABLE IF EXISTS assignment;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS enclosure;
DROP TABLE IF EXISTS staff;

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT
);

CREATE TABLE enclosure(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE animal(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosure_id INT REFERENCES enclosure(id)
);

CREATE TABLE assignment(
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES staff(id),
    enclosure_id INT REFERENCES enclosure(id),
    day VARCHAR(255)
);

INSERT INTO staff (name, employeeNumber) VALUES ('John', 1);
INSERT INTO staff (name, employeeNumber) VALUES ('Ben', 2);
INSERT INTO staff (name, employeeNumber) VALUES ('Greg', 3);


INSERT INTO enclosure(name, capacity, closedForMaintenance) VALUES('Lion Pen', 5, false);
INSERT INTO enclosure(name, capacity, closedForMaintenance) VALUES('Bird Cage', 2, true);

INSERT INTO animal(name, type, age, enclosure_id) VALUES ('Simba','Lion', 2, 1);
INSERT INTO animal(name, type, age, enclosure_id) VALUES ('Polly','Parrot', 20, 2);
INSERT INTO animal(name, type, age, enclosure_id) VALUES ('Birdy','Parrot', 20, 2);

INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (1, 1, 'Monday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (2, 1, 'Tuesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (2, 1, 'Wednesday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (3, 1, 'Monday');
INSERT INTO assignment(employee_id, enclosure_id, day) VALUES (1, 2, 'Tuesday');


