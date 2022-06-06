##Postgres DB Notes

##Mario Database

psql --username=name dbname=dbname
psql --username=name --list
postgres cmds 
\l -- displays databases by default
\c -- connect database
\d -- displays relations

psql --username=<user> dbname=<dbname> #access 
psql --username=<user> --list	#lists all dbs under than user
\c -- connects to db
\d [option: <table_name>] -- displays all relations/tables/specific table
\l -- lists all dbs
column_types
INT 
VARCHAR
SERIAL - INT and NOT NULL, and auto increment the integer when a new row is added.

constraints
NOT NULL
UNIQUE


CREATE TABLE <table_name> #creates table
ALTER TABLE <table_name> ADD COLUMN <column_name> <column_type> <column_constraint> # adds column
ALTER TABLE <table_name> ALTER COLUMN <column_name> TYPE <column_type> # modify column
ALTER TABLE <table_name> ALTER COLUMN <column_name> SET NOT NULL # modify column
ALTER TABLE <table_name> RENAME COLUMN <column_name> TO <column_name> # modify column
INSERT INTO <table_name>(<column_name>,<column_name2>..) VALUES(<value>,<value2>..);
UPDATE <table_name> SET <column_name>=new_value WHERE condition;
SELECT columns`(*)` FROM <table_name> ORDER BY <column_name>;
ALTER TABLE table_name ADD PRIMARY KEY(column_name);
(first check the table info)
ALTER TABLE some_table DROP CONSTRAINT constraint_name;

## This created row as foreign key
ALTER TABLE table_name ADD COLUMN column_name DATATYPE constraint REFERENCES referenced_table_name(referenced_column_name); # references one column with another 
ALTER TABLE table_name ADD UNIQUE(column_name); # make certain column unique if they have one to one 
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES referenced_table(referenced_column);

# find specific based on where condition
SELECT columns FROM table_name WHERE condition;

# creating tables with existing column + constraints
CREATE TABLE table_name(column_name DATATYPE CONSTRAINTS);

#sort table
SLECT * FROM <table_name> ORDER BY <column_name>;

#composite primary keys
ALTER TABLE table_name ADD PRIMARY KEY(column1, column2);

# joining table 
SELECT columns FROM table_1 FULL JOIN table_2 ON table_1.primary_key_column = table_2.foreign_key_column;
SELECT columns FROM junction_table
FULL JOIN table_1 ON junction_table.foreign_key_column = table_1.primary_key_column
FULL JOIN table_2 ON junction_table.foreign_key_column = table_2.primary_key_column;

example: 
SELECT * FROM characters
FULL JOIN character_actions ON characters.character_id = character_actions.character_id
FULL JOIN actions ON character_actions.action_id = actions.action_id;


#to dump all postgres stuff 

pg_dump -cC --inserts -U <username> <dbname> > <dbname>.sql