#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same

var_string="TestString"
var_pass="password"

[ $var_string = $var_pass ] && echo "You guessed the password!" || echo "The password eludes you..."

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data

prompt="Guess the password : "
read -p "$prompt" var_string

var_pass="password"
[ $var_string = $var_pass ] && echo "You guessed the password!" || echo "The password eludes you..."

# TASK 2: Improve it by rewriting it to use the if command

read -p "Guess the password and enter it here:" var_string

if [ $var_string = $var_pass ]
then
  echo "You guessed the password!"
else
  echo "The password eludes you..."
fi

# TASK 3: Improve it by giving them 3 tries to get it right before failing (test 3 times but only if necessary)
#           *** Do not use the exit command

echo "Guess the password - you have three chances!"

  guess_num=3

  for ((k=1; k<=$guess_num; k++)) ;
  do
    prompt="Guess the password and enter it here:"
    read -p "$prompt" var_string
    if [ $var_string = $var_pass ]
    then
      echo "Good job, You guessed the password!"
      break
    else
      echo "Sorry, the password eludes you..."
    fi
    if [ $k -ge $guess_num ] ; then echo "Sorry, the password eludes you..."
      break
    fi
  done
