#!/bin/bash
# This is a script to practice doing testing in bash scripts

# This section demonstrates file testing

# Test for the existence of the /etc/resolv.conf file

test -e /etc/resolv.conf && echo "/etc/resolv.conf exists" || echo "/etc/resolv.conf does not exist"

# TASK 1: Add a test to see if the /etc/resolv.conf file is a regular file

test -f /etc/resolv.conf && echo "/etc/resolv.conf is a regular file" || echo "/etc/resolv.conf is not a regular file"

# TASK 2: Add a test to see if the /etc/resolv.conf file is a symbolic link

test -h /etc/resolv.conf && echo "/etc/resolv.conf is a symbolic link" || echo "/etc/resolv.conf is not a symbolik link"

# TASK 3: Add a test to see if the /etc/resolv.conf file is a directory

test -d /etc/resolv.conf && echo "/etc/resolv.conf is a directory" || echo "/etc/resolv.conf is not a dirctory"

# TASK 4: Add a test to see if the /etc/resolv.conf file is readable

test -r /etc/resolv.conf && echo "/etc/resolv.conf is readable" || echo "/etc/resolv.conf is not readable"

# TASK 5: Add a test to see if the /etc/resolv.conf file is writable

test -w /etc/resolv.conf && echo "/etc/resolv.conf is writable" || echo "/etc/resolv.conf is not writable"

# TASK 6: Add a test to see if the /etc/resolv.conf file is executable

test -x /etc/resolv.conf && echo "/etc/resolv.conf is executable" || echo "/etc/resolv.conf is not executable"




# Tests if /tmp is a directory

[ -d /tmp ] && echo "/tmp is a directory" || echo "/tmp is not a directory"

# TASK 4: Add a test to see if the /tmp directory is readable

[ -r /tmp ] && echo "/tmp is readable" || echo "/tmp is not a readable"

# TASK 5: Add a test to see if the /tmp directory is writable

[ -w /tmp ] && echo "/tmp is writable" || echo "/tmp is not a writable"

# TASK 6: Add a test to see if the /tmp directory can be accessed

[ -x /tmp ] && echo "/tmp can be accessed" || echo "/tmp cannot be accessed"



# Tests if one file is newer than another
# TASK 7: Add testing to print out which file newest, or if they are the same age
[ /etc/hosts -nt /etc/resolv.conf ] && echo "/etc/hosts is newer than /etc/resolv.conf"
[ /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/resolv.conf is newer than /etc/hosts"
[ ! /etc/hosts -nt /etc/resolv.conf ] -a [ ! /etc/hosts -ot /etc/resolv.conf ] && echo "/etc/hosts is the same age as /etc/resolv.conf"

# this section demonstrates doing numeric tests in bash

# TASK 1: Improve it by getting the user to give us the numbers to use in our tests

prompt="Enter two numbers : "
read -p "$prompt" num1 num2

# TASK 2: Improve it by adding a test to tell the user if the numbers are even or odd

[ $((num1%2)) -eq 0 ] && echo "$num1 is an even number" || echo "$num1 is an odd number"

[ $((num2%2)) -eq 0 ] && echo "$num2 is an even number" || echo "$num2 is an odd number"

# TASK 3: Improve it by adding a test to tell the user is the second number is a multiple of the first number


[ $((num2 % num1)) -eq 0 ] && echo "$num2 is a multiple of $num1" || echo "$num2 is not a multiple of $num1"

[ $num1 -eq $num2 ] && echo "The two numbers are the same"
[ $num1 -ne $num2 ] && echo "The two numbers are not the same"
[ $num1 -lt $num2 ] && echo "The first number is less than the second number"
[ $num1 -gt $num2 ] && echo "The first number is greater than the second number"

[ $num1 -le $num2 ] && echo "The first number is less than or equal to the second number"
[ $num1 -ge $num2 ] && echo "The first number is greater than or equal to the second number"

# This section demonstrates testing variables

# Test if the USER variable exists

[ -v USER ] && echo "The variable SHELL exists"

# TASK 1: Add a command that prints out a labelled description of what is in the USER variable, but only if it is not empty

test -n USER && echo "USER is an environment variable. It contains the user name." || echo "Variable is empty"

# TASK 2: Add a command that tells the user if the USER variable exists, but is empty

test -v USER && test -z USER && echo "The USER variable exists, but it is empty"

# Tests for string data

a=1
b=01
[ $a = $b ] && echo "$a is alphanumerically equal to $b" || echo "$a is not alphanumerically equal to $b"

# TASK 3: Modify the command to use the != operator instead of the = operator, without breaking the logic of the command

a=1
b=01
[ $a != $b ] && echo "$a is not alphanumerically equal to $b" || echo "$a is alphanumerically equal to $b"

# TASK 4: Use the read command to ask the user running the script to give us strings to use for the tests

#Asking user to enter two strings

read -p "Please enter two strings here:" a b

[ $a = $b ] && echo "$a is alphanumerically equal to $b" || echo "$a is not alphanumerically equal to $b"
