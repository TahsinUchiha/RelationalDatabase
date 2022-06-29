#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to insert data from games.csv to worldcupdb

# Truncate existing data
echo $($PSQL "TRUNCATE teams,games")

# read from games.csv 
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
# echo $YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS
# insert into teams, both winners and opponents (unique), omiting header
if [[ $WINNER != 'winner' ]] || [[ $OPPONENT != 'opponent' ]]
then
# check if name for winner does not exists then insert into db
  if [[ $($PSQL "SELECT name FROM teams WHERE name='$WINNER'") ]] 
  then
  echo $WINNER already exists
  else
  INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    if [[ $INSERT_TEAM == "INSERT 0 1" ]]
    then
    echo "$WINNER inserted into teams"
    fi
#WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  fi
# check if name for opponent does not exists then insert into db
  if [[ $($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'") ]] 
  then
  echo $OPPONENT already exists
  else
  INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    if [[ $INSERT_TEAM == "INSERT 0 1" ]]
    then
    echo "$OPPONENT inserted into teams"
    fi
#OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  fi

# insert into games, for all games played
WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
INSERT_GAMES=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
# echo $($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  if [[ $INSERT_GAMES == "INSERT 0 1" ]]
    then
    echo "Inserted into games for $WINNER vs $OPPONENT"
  fi
fi  
done