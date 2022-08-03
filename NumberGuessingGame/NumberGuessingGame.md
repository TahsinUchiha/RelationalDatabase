# psql -U <username> -d <database>
# pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql 
# psql -U postgres < number_guess.sql
# PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

#Info:
	--A script that generates a random number between 1 and 1000.
	--Create a number_guess database to hold the information suggested in the user stories.

# Create a number_guessing_game folder in the project folder for your program
- mkdir number_guessing_game
# Create number_guess.sh in your number_guessing_game folder and give it executable permissions
- touch number_guess.sh 
- chmod +x number_guess.sh 

# Turn the number_guessing_game folder into a git repository
git init 
git checkout -b main 

# Create database number_guess 
CREATE DATABASE number_guess;

# Create table users, column user_id (unique) username
# Create table scoreboard, column games_played, best_game
CREATE TABLE users(
user_id SERIAL UNIQUE, 
username VARCHAR(22) UNIQUE NOT NULL);

CREATE TABLE scoreboard(
game_id SERIAL,
score INT NOT NULL,
user_id INT NOT NULL);

ALTER TABLE scoreboard ADD FOREIGN KEY(user_id) REFERENCES users(user_id); 

# Add database connection logic in script, reading count(game_id) for each user and best score 

