##Building Five Programs Notes
--Building a script
create - touch questionnaire.sh
create - touch countdown.sh

info - sh <script>.sh (shell interpreter)
info - bash <script>.sh (bourne-again shell)

shows the location of bash - which bash  

at the very top - #!<path_to_interpreter>
#!/bin/bash
r - read
w - write
x - execute

give execute permission by  - chmod +x questionnare.sh

run by  - ./questionnaire.sh 

man (manual) / similar to --help
man echo
help if
```
if [[ CONDITION ]]
then
  STATEMENTS
fi
```
```
if [[ CONDITION ]]
then
  STATEMENTS
else
  STATEMENTS
fi
```

-eq (equal)
-ne (not equal)
-lt (less than)
-le (less than or equal)
-gt (greater than)
-ge (greater than or equal)



$* -> prints all arguments 
$@ -> prints all arguments
$1 -> prints first argument
$? - (last exit status)
0 - true
1 - false
example,
echo $* -> all arguments given after script
echo $1 -> will print first argument 

 File operators:

      -a FILE        True if file exists.
      -b FILE        True if file is block special.
      -c FILE        True if file is character special.
      -d FILE        True if file is a directory.
      -e FILE        True if file exists.
      -f FILE        True if file exists and is a regular file.
      -g FILE        True if file is set-group-id.
      -h FILE        True if file is a symbolic link.
      -L FILE        True if file is a symbolic link.
      -k FILE        True if file has its `sticky' bit set.
      -p FILE        True if file is a named pipe.
      -r FILE        True if file is readable by you.
      -s FILE        True if file exists and is not empty.
      -S FILE        True if file is a socket.
      -t FD          True if FD is opened on a terminal.
      -u FILE        True if the file is set-user-id.
      -w FILE        True if the file is writable by you.
      -x FILE        True if the file is executable by you.
      -O FILE        True if the file is effectively owned by you.
      -G FILE        True if the file is effectively owned by your group.
      -N FILE        True if the file has been modified since it was last read.

      FILE1 -nt FILE2  True if file1 is newer than file2 (according to
                       modification date).

      FILE1 -ot FILE2  True if file1 is older than file2.

      FILE1 -ef FILE2  True if file1 is a hard link to file2.

    String operators:

      -z STRING      True if string is empty.

      -n STRING
         STRING      True if string is not empty.

      STRING1 = STRING2
                     True if the strings are equal.
      STRING1 != STRING2
                     True if the strings are not equal.
      STRING1 < STRING2
                     True if STRING1 sorts before STRING2 lexicographically.
      STRING1 > STRING2
                     True if STRING1 sorts after STRING2 lexicographically.

    Other operators:

      -o OPTION      True if the shell option OPTION is enabled.
      -v VAR         True if the shell variable VAR is set.
      -R VAR         True if the shell variable VAR is set and is a name
                     reference.
      ! EXPR         True if expr is false.
      EXPR1 -a EXPR2 True if both expr1 AND expr2 are true.
      EXPR1 -o EXPR2 True if either expr1 OR expr2 is true.

      arg1 OP arg2   Arithmetic tests.  OP is one of -eq, -ne,
                     -lt, -le, -gt, or -ge.

    Arithmetic binary operators return true if ARG1 is equal, not-equal,
    less-than, less-than-or-equal, greater-than, or greater-than-or-equal
    than ARG2.

you can print in the same line;
e.g.
[[ 4 -ge 5 ]]; echo $?
<<command>>; echo $? -> give exit status 

if a file exists - [[ -a countdown.sh ]]; echo $? 

test multiple expressions

[[ expression1 && expression2 ]]
[[ expression1 || expression2 ]]


for (( i = 10; i > 0; i-- ))
do
  echo $i
done

: ' 

comment
second comment 

' 

while [[ condition ]]
do 
	statements
done

prints all - printenv
prints all variable - declare -p <variable> 

Double parenthesis -> (( I++ ))
Would print out the value inside - echo $(( I + 4 ))
J = $(( I - 6 ))
echo $(( J * 5 + 25 ))

e.g
declare -p J --> will print out value of J

```
if (( CONDITION ))
then
  STATEMENTS
elif [[ CONDITION ]]
then
  STATEMENTS
fi
```

echo ${ARR[@]}

creating ARR
ARR=("A" "B" "C")
echo ${ARR[0]}

FUNCTION_COMMAND() {
 STATEMENTS
}

until [[ CONDITION ]]
do
  STATEMENTS
done

[[ 'hello world' =~ ^h.+d$ ]]; echo $?

type: type [-afptP] name [name ...]
    Display information about command type.
    
    For each NAME, indicate how it would be interpreted if used as a
    command name.
    
    Options:
      -a        display all locations containing an executable named NAME;
                includes aliases, builtins, and functions, if and only if
                the `-p' option is not also used
      -f        suppress shell function lookup
      -P        force a PATH search for each NAME, even if it is an alias,
                builtin, or function, and returns the name of the disk file
                that would be executed
      -p        returns either the name of the disk file that would be executed,
                or nothing if `type -t NAME' would not return `file'
      -t        output a single word which is one of `alias', `keyword',
                `function', `builtin', `file' or `', if NAME is an alias,
                shell reserved word, shell function, shell builtin, disk file,
                or not found, respectively
    
    Arguments:
      NAME      Command name to be interpreted.

Content of questionnaire.sh{
#!/bin/bash
QUESTION1="What's your name?"
QUESTION2="Where are you from?"
QUESTION3="What's your favorite coding website?"
echo -e "\n~~ Questionnaire ~~\n"
echo $QUESTION1
read NAME
echo $QUESTION2
read LOCATION
echo $QUESTION3
read WEBSITE
echo -e "\n"
echo Hello $NAME from $LOCATION. I learned that your favorite coding website is $WEBSITE!
}

Content of countdown.sh {
#!/bin/bash

# Program that counts down to zero from a given argument

echo -e "\n~~ Countdown Timer ~~\n"

if [[ $1 -gt 0 ]]
then
: '  for (( i = $1; i >= 0; i-- ))
  do
    echo $i
    sleep 1
  done '
  I=$1
  while [[ $I -ge 0 ]]
  do
    echo $I
    (( I-- ))
    sleep 1
  done

else
  echo Include a positive integer as the first argument.
fi

}

Content of bingo.sh {
#!/bin/bash

# Bingo Number Generator

echo -e "\n~~ Bingo Number Generator ~~\n"

NUMBER=$(( RANDOM % 75 + 1 ))
TEXT="The next number is, "

if (( NUMBER <=15 ))
  then
    echo $TEXT B:$NUMBER
  elif [[ $NUMBER -le 30 ]]
  then 
    echo $TEXT I:$NUMBER
  elif (( NUMBER < 46 ))
  then  
    echo $TEXT N:$NUMBER
  elif [[ $NUMBER -lt 61 ]]
  then  
    echo $TEXT G:$NUMBER  
  else
    echo $TEXT O:$NUMBER
fi

}

Content of fortune.sh {

#!/bin/bash

# Program to tell a persons fortune

echo -e "\n~~ Fortune Teller ~~\n"

RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
N=$(( RANDOM % 6 ))

function GET_FORTUNE() {
  if [[ ! $1 ]]
  then
    echo Ask a yes or no question:
  else
    echo Try again. Make sure it ends with a question mark:
  fi

  read QUESTION
}

GET_FORTUNE
until [[ $QUESTION =~ \?$ ]]
do
  GET_FORTUNE again 
done

echo -e "\n${RESPONSES[$N]}"

}


Content of five.sh {

#!/bin/bash

# Program to run my other four programs

./questionnaire.sh
./countdown.sh 3
./bingo.sh
./fortune.sh

}