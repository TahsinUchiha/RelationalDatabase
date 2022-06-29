psql --username=freecodecamp --dbname=students
pg_dump -cC --inserts -U freecodecamp students > students.sql
REBUILD 
psql -U postgres < students.sql

-For Students Table + Courses DB

CREATE DATABASE students

> Create Students table		  (unique students) 	
CREATE TABLE students();
	ALTER TABLE students ADD COLUMN student_id SERIAL PRIMARY KEY;
	ALTER TABLE students ADD COLUMN first_name VARCHAR(50) NOT NULL;
	ALTER TABLE students ADD COLUMN last_name VARCHAR(50) NOT NULL;
	ALTER TABLE students ADD COLUMN major_id INT;
	ALTER TABLE students ADD COLUMN gpa NUMERIC(2,1);


> Create Majors table		  (unique majors) 
CREATE TABLE majors();
	ALTER TABLE majors ADD COLUMN major_id SERIAL PRIMARY KEY;
	ALTER TABLE majors ADD COLUMN major VARCHAR(50) NOT NULL;


> Set major_id from students as a foreign key to the majors table
	ALTER TABLE students ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
	
	
> Create Courses table		  (unique courses)
CREATE TABLE courses();
	ALTER TABLE courses ADD COLUMN course_id SERIAL PRIMARY KEY;
	ALTER TABLE courses ADD COLUMN course VARCHAR(100) NOT NULL;


> Create Majors_Courses table (junction)
CREATE TABLE majors_courses();
	ALTER TABLE majors_courses ADD COLUMN major_id INT;
	ALTER TABLE majors_courses ADD COLUMN course_id INT;
	ALTER TABLE majors_courses ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
	ALTER TABLE majors_courses ADD FOREIGN KEY(course_id) REFERENCES courses(course_id);
	ALTER TABLE majors_courses ADD PRIMARY KEY(course_id, major_id); --composite primary key for two unique primary keys

> Adding in majors from the courses.csv file 
INSERT INTO majors(major) VALUES('Database Administration');

> Adding in courses from the courses.csv file
INSERT INTO courses(course) VALUES('Data Structures and Algorithms'); 

> Adding in major_id + course_id to majors_courses from courses.csv
INSERT INTO majors_courses(course_id, major_id) VALUES(1,1); 

> Adding in data to students from students.csv 
INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('Rhea','Kellems',1,2.5);

> Create script to automate inserting data from csv into table

declare -p IFS ## (shows info about IFS)
(This variable is used to determine word boundaries. It defaults to spaces, tabs, and new lines. 
This is why the MAJOR variable was set to only the first word on each line from the data. 
Between the while and read commands, set the IFS to a comma like this: IFS=",")

> Delete data in tables
TRUNCATE majors, students, majors_courses; -- truncates data in all three tables 

> finish script

> pg_dump dbname
	pg_dump --help
	pg_dump --clean --create --inserts --username=freecodecamp students > students.sql

