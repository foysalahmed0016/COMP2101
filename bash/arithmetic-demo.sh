#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the rem operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number

#Asking user to enter two numbers
read -p "Enter two numbers:"  number1 number2

# Operations

sum=$((number1 + number2))
min=$((number1 - number2))
dividend=$((number1 / number2))
rem=$((number1 % number2))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $number1/$number2}")
multi=$((number1 * number2))
power_of=$((number1 ** number2))

#Main Program

cat <<EOF

$number1 plus $number2 is $sum .

$number1 min $number2 is $min .

$number1 multiplied by $number2 is $multi .

$number1 divided by $number2 is $dividend with a remainder of $rem .
  - More precisely, it is $fpdividend .

$number1 raised to $number2 is $power_of .
EOF
