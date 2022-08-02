# psql -U <username> -d <database>
# pg_dump -cC --inserts -U <username> periodic_table > periodic_table.sql 
# pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql 
# psql -U postgres < periodic_table.sql
CREATE DATABASE periodic_table
CREATE TABLE elements(
atomic_number INT NOT NULL,
symbol VARCHAR(2),
name VARCHAR(40)
)
ALTER TABLE elements ADD PRIMARY KEY atomic_number;
ALTER TABLE elements ADD UNIQUE atomic_number;
CREATE TABLE properties(
atomic_number INT NOT NULL,
type VARCHAR(30),
weight NUMERIC(9,6) NOT NULL,
melting_point NUMERIC,
boiling_point NUMERIC
) 
ALTER TABLE properties ADD PRIMARY KEY atomic_number;
ALTER TABLE properties ADD UNIQUE atomic_number;

--ALTER TABLE table_name RENAME COLUMN old_name TO new_name;
# Rename weight to atomic_mass in properties 
# Rename melting_point to melting_point_celsius in properties and Rename boiling_point to boiling_point_celsius in properties 
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

# melting_point_celsius and boiling_point_celsius should be NOT NULL
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL; 
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL; 

# Add UNIQUE constraint to symbol and name from elements table 
ALTER TABLE elements ADD UNIQUE(symbol,name);

# symbol and name should be NOT NULL 
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;

# Set atomic_number from properties table as foreign key that references the column from elements table 
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number); 

# Create a table "types" that will store three types of elements (nonmetal, metal, metalloid) 
# "types" table should have type_id INT PRIMARY KEY 
# "types" table should have type VARCHAR NOT NULL 
CREATE TABLE types(
type_id INT PRIMARY KEY,
type VARCHAR(30) NOT NULL
);

# "types" table INSERT the three seperate type from properties (three rows only)
INSERT INTO types(type_id, type) VALUES(1, 'nonmetal');
INSERT INTO types(type_id, type) VALUES(2, 'metal');
INSERT INTO types(type_id, type) VALUES(3, 'metalloid');

# properties table should have type_id as foreign key that references type_id column from types, INT NOT NULL
# each row in properties should have type_id value that links 
ALTER TABLE properties ADD COLUMN type_id INT;  
UPDATE properties SET type_id = 1 WHERE type='nonmetal';
UPDATE properties SET type_id = 2 WHERE type='metal';
UPDATE properties SET type_id = 3 WHERE type='metalloid';
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;  
ALTER TABLE properties ADD FOREIGN KEY(type_id) REFERENCES types(type_id);

# capitalise the first letter of all symbol values in elements 
SELECT INITCAP(symbol) from elements; 
UPDATE elements SET symbol = INITCAP(symbol); 

# You should remove all the trailing zeros after the decimals from each row of the atomic_mass column. 
You may need to adjust a data type to DECIMAL for this.
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;
SELECT atomic_mass::REAL FROM properties;
UPDATE properties SET atomic_mass=atomic_mass::REAL; 


# You should add the element with atomic number 9 to your database. 
"Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal"
INSERT INTO elements(atomic_number,symbol,name) VALUES(9, 'F', 'Fluorine');
INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(9, 'nonmetal', 18.998, -220, -188.1,1);

# You should add the element with atomic number 10 to your database. 
"Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's a nonmetal"
INSERT INTO elements(atomic_number,symbol,name) VALUES(10, 'Ne', 'Neon');
INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES(10, 'nonmetal', 20.18, -248.6, -246.1, 1);

# Delete record atomic_number=1000 
DELETE FROM properties WHERE atomic_number=1000;
DELETE FROM elements WHERE atomic_number=1000;

# delete 'type' column and fix logic on element.sh script 
ALTER TABLE properties DROP COLUMN type;
