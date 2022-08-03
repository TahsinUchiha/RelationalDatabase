#!/bin/bash 
# Generate a number between 1 and 1000 
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
n=1000
NUMBER=$(( RANDOM % $n + 1))
CHECK_USER() {
username=$($PSQL "SELECT username FROM users WHERE username='$NAME'")
if [[ $username ]]
then
  echo 0
else
  echo 1
fi
}

ADD_USER() {
  USER_ADD=$($PSQL "INSERT INTO users(username) VALUES('$NAME')")
}

ADD_GAME() {
  user_id=$1
  score=$2
  GAME_ADD=$($PSQL "INSERT INTO scoreboard(user_id,score) VALUES($user_id,$score)")
}

INTRO() {
  QUESTION="Enter your username:"
  echo -e $QUESTION
  read NAME
  if [[ $NAME ]]
  then
    check_user=$(CHECK_USER)
    if [[ $check_user == 0 ]]
    then
      user_id=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")
      username=$($PSQL "SELECT username FROM users WHERE username='$NAME'")
      games_played=$($PSQL "SELECT COUNT(game_id) from scoreboard where user_id=$user_id")
      best_game=$($PSQL "SELECT MIN(score) FROM scoreboard WHERE user_id=$user_id")
      RETURN_WELCOME_MSG="Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
      echo -e "$(echo $RETURN_WELCOME_MSG | sed 's/^ *| *$//g')" # remove unneeded spaces 
    else
      user_id=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")
      WELCOME_MSG="Welcome, $NAME! It looks like this is your first time here."
      echo -e "$(echo $WELCOME_MSG | sed 's/^ *| *$//g')" # remove unneeded spaces 
    fi
  else
    echo -e "Please enter a valid name."
  fi
  
}
count=1
GAME() {
  echo -e "Guess the secret number between 1 and 1000:"
  guess_number=0
  while [[ $guess_number != $NUMBER ]]
  do
  read guess_number
    if [[ ! $guess_number =~ ^[0-9]+$ ]]
    then
      echo -e "That is not an integer, guess again:"
      count=$(($count+1))
    elif [[ $NUMBER == $guess_number ]]
    then
      break
    elif [[ $NUMBER > $guess_number ]]
    then
      echo -e "It's higher than that, guess again:"
      count=$(($count+1))
    else
      echo -e "It's lower than that, guess again:"
      count=$(($count+1))
    fi
  done
  echo -e "You guessed it in $count tries. The secret number was $NUMBER. Nice job!"
}

DB_EXECUTE(){
check_user=$(CHECK_USER)
if [[ $check_user == 1 ]]
then 
  ADD_USER
fi
user_id=$($PSQL "SELECT user_id FROM users WHERE username='$NAME'")
ADD_GAME $user_id $count
}

INTRO 
GAME
DB_EXECUTE