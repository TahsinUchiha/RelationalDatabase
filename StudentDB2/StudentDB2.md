psql --username=freecodecamp --dbname=students
pg_dump -cC --inserts -U freecodecamp students > students.sql
REBUILD 
psql -U postgres < students.sql

-For Students Table + Courses DB

> Create a script to find student_info 
SQL search conditions:
	group conditions - WHERE <condition_1> AND (<condition_2> OR <condition_2>)
	finding pattern - WHERE <column> LIKE '<pattern>' 
	<patterns>:
#	(_) -- Underscore in a pattern will return rows that have any character in that spot.
		> SELECT * from courses where course like '_lgorithms';	
#	(ends_with)	(%) -- to find names, that start with 'W' you can use 'W%', to view course
	end in 'lgorithms' -> '%lgorithms'	
		> SELECT * from courses where course like '%lgorithms';
#	courses that start with 'Web'
		> SELECT * FROM courses where course like 'Web%';
# 	courses that have second letter of 'e' 
		> SELECT * FROM courses where course like '_e%';
# 	courses that have a space in their names;
		> SELECT * from courses where course like '% %';
# Can use 'NOT LIKE' for opposite;
# 	courses that don't have a space
		> SELECT * from courses where course NOT LIKE '% %';
# 	courses that contain 'A'
		> SELECT * from courses where course LIKE '%A%';
#	courses that contain 'A' ignoring case!
		> SELECT * from courses where course ILIKE '%a%';
#   courses that don't contain 'a' and has spaces
		> SELECT * from courses where course NOT ILIKE '%a%' AND course LIKE '% %';
# 	display students with null or no info 
		> SELECT * FROM Students WHERE gpa IS NULL;
# 	display students with only info  
		> SELECT * FROM Students WHERE gpa IS NOT NULL;		
#   Order of results -- add (DESC) at the end for order by desc
		> SELECT * FROM students ORDER BY <column_name> ;
		> SELECT * FROM students ORDER BY <column_name1> desc, <column_name2>;
#	LIMIT number of results
		> SELECT * FROM students ORDER BY <column_name1> desc, <column_name2> LIMIT 10;
#	Find MIN,MAX,SUM,AVG for Numerical columns
		> SELECT MIN(<column_name>) from students;
		> SELECT MAX(<column_name>) from students;
		> SELECT AVG(<column_name>) from students;
		> SELECT SUM(<column_name>) from students;
#	Average number to nearest wholenumber with CEIL(round up),FLOOR(round down),ROUND(normal)
		SELECT CEIL(AVG(<column_name>)) from students;
		SELECT ROUND(AVG(<column_name>), <decimal_places>) from students;

#	COUNT(*), COUNT(<column_name>) - gives the count of the rows
		SELECT COUNT(*) from students;
		SELECT COUNT(<column_name>) from students;
		
#	DISTINCT(<column_name>), GROUP BY -- gives unique values
		SELECT DISTINCT(<column_name>) from students;
		SELECT <column_name> from students GROUP BY <column_name>;
		
# 	GROUP BY clause allows you to combine with MIN,MAX,COUNT, etc.
		SELECT COUNT(*) FROM students GROUP BY major_id; --how many students in each unique major
		SELECT major_id, COUNT(*) FROM students GROUP BY major_id; --how many students in each unique major
		
#	When using the group by with other columns, you can use the aggregate functions
	MIN, AVG, COUNT, MAX etc.
		> SELECT min(gpa),major_id from students group by major_id;

#	Another option with GROUP BY is HAVING (condition must be aggregate)
		> SELECT <column> FROM <table> GROUP BY <column> HAVING <condition>
		> SELECT min(gpa),MAX(gpa),major_id from students group by major_id HAVING MAX(GPA) = 4.0;
		
#	Rename a column with AS 
		> SELECT <column> AS <new_column_name>		

# 	JOINING tables FULL, LEFT, RIGHT, INNER  
--shows all	
	> SELECT * FROM <table_1> FULL JOIN <table_2> ON <table_1>.<foreign_key_column> = <table_2>.<foreign_key_column>;
--shows all from the left table.
	> SELECT * FROM <table_1> LEFT JOIN <table_2> ON <table_1>.<foreign_key_column> = <table_2>.<foreign_key_column>;
--shows all from the right table.	
	> SELECT * FROM <table_1> RIGHT JOIN <table_2> ON <table_1>.<foreign_key_column> = <table_2>.<foreign_key_column>;
--shows only values of matching foreign_key_column; shared by both tables
	> SELECT * FROM <table_1> RIGHT JOIN <table_2> ON <table_1>.<foreign_key_column> = <table_2>.<foreign_key_column>;
--shows only the column you need - distinct gives unique	
	> SELECT DISTINCT(major) FROM students INNER JOIN majors ON students.major_id = majors.major_id;	
--shows all the data on the right table where majors are not picked
	> SELECT * FROM students RIGHT JOIN majors ON students.major_id = majors.major_id WHERE student_id IS NULL;	
	
#shortcut-> USING - if the foreign key column has the same name in both table
	> SELECT * FROM <table_1> FULL JOIN <table_2> USING(<column>);
--3 table join
	> SELECT * FROM <table_1> FULL JOIN <table_2> USING(<column>) FULL JOIN <table_3> USING(<column>)
	