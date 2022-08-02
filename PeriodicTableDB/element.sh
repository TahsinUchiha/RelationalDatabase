#!/bin/bash 
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"
arg=$1
size=${#arg} 
if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    atomic_number=$($PSQL "SELECT atomic_number FROM elements where atomic_number=$1")
    if [[ $atomic_number ]]
    then
      symbol=$($PSQL "SELECT symbol FROM elements where atomic_number=$1")
      name=$($PSQL "SELECT name FROM elements where atomic_number=$1")
      type=$($PSQL "SELECT type FROM properties LEFT JOIN types USING(type_id) WHERE atomic_number=$atomic_number")
      atomic_mass=$($PSQL "SELECT atomic_mass FROM properties where atomic_number=$atomic_number")
      melting_point_celsius=$($PSQL "SELECT melting_point_celsius FROM properties where atomic_number=$atomic_number")
      boiling_point_celsius=$($PSQL "SELECT boiling_point_celsius FROM properties where atomic_number=$atomic_number")
      output="The element with atomic number $atomic_number is $name ($(echo $symbol | sed 's/^ *| *$//g')). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
      echo -e "$(echo $output | sed 's/^ *| *$//g')"
    else
      echo -e "I could not find that element in the database."
    fi
  elif [[ $size -le 2 ]]
  then
    atomic_number=$($PSQL "SELECT atomic_number FROM elements where symbol='$1'")
    if [[ $atomic_number ]]
    then
      symbol=$($PSQL "SELECT symbol FROM elements where symbol='$1'")
      name=$($PSQL "SELECT name FROM elements where symbol='$1'")
      type=$($PSQL "SELECT type FROM properties LEFT JOIN types USING(type_id) WHERE atomic_number=$atomic_number")
      atomic_mass=$($PSQL "SELECT atomic_mass FROM properties where atomic_number=$atomic_number")
      melting_point_celsius=$($PSQL "SELECT melting_point_celsius FROM properties where atomic_number=$atomic_number")
      boiling_point_celsius=$($PSQL "SELECT boiling_point_celsius FROM properties where atomic_number=$atomic_number")
      output="The element with atomic number $atomic_number is $name ($(echo $symbol | sed 's/^ *| *$//g')). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
      echo -e "$(echo $output | sed 's/^ *| *$//g')"
    else
      echo -e "I could not find that element in the database."
    fi
  else
    atomic_number=$($PSQL "SELECT atomic_number FROM elements where name='$1'")
    if [[ $atomic_number ]]
    then
      symbol=$($PSQL "SELECT symbol FROM elements where name='$1'")
      name=$($PSQL "SELECT name FROM elements where name='$1'")
      type=$($PSQL "SELECT type FROM properties LEFT JOIN types USING(type_id) WHERE atomic_number=$atomic_number")
      atomic_mass=$($PSQL "SELECT atomic_mass FROM properties where atomic_number=$atomic_number")
      melting_point_celsius=$($PSQL "SELECT melting_point_celsius FROM properties where atomic_number=$atomic_number")
      boiling_point_celsius=$($PSQL "SELECT boiling_point_celsius FROM properties where atomic_number=$atomic_number")
      output="The element with atomic number $atomic_number is $name ($(echo $symbol | sed 's/^ *| *$//g')). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
      echo -e "$(echo $output | sed 's/^ *| *$//g')"
    else
      echo -e "I could not find that element in the database."
    fi
  fi
else
  echo -e "Please provide an element as an argument."
fi 