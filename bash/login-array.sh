#!/bin/bash
#
# This script produces the dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!


###############
# Variables   #
###############

titles=("OverLord" "Achiever" "Warrior" "Kind Soul" "Tall" "Happy Kid" "Finisher")
number=$(( ${#titles[@]} ))
var_random=$(( RANDOM % number ))
hostname=$(hostname)
time=$(date +'%I:%M %p')
day=$(date +%A)

###############
# Main        #
###############


cowsay "Welcome to planet $hostname, "${titles[$var_random]} $USER!"
The time is $time on a $day."
