#!/bin/bash

# This script demonstrates how to trap signals and handle them using functions

trap interrupt_fn 2
trap secret_fn 3

# Task: Add traps for the INT and QUIT signals. If the script receives an INT signal,
#       reset the count to the maximum and tell the user they are not allowed to interrupt
#       the count. If the script receives a QUIT signal, tell the user they found the secret
#       to getting out of the script and exit immediately.

function secret_fn {
  echo "You found out the secret to getting out of the script."
  exit
}

# Task: Explain in a comment how the line with the word moose in it works.

#### Variables
programName="$(basename $0)" # used by error_functions.sh
sleepTime=1 # delay used by sleeptime
numberOfSleeps=10 # how many sleeps to wait for before quitting for inactivity

#### Functions

# This function will send an error message to stderr
# Usage:
#   error_fn ["some text to print to stderr"]


#Task : It prints programName and the first arguments, > redirect stdout by default
# & is a file descriptor in the right hand side of >
# 2 stderr file descriptor number for standard error
# It basically redirects stdout from the given echo command to stderr

function error_fn {
        echo "${programName}: ${1:-Unknown Error - a moose bit my sister once...}" >&2
}

# This function will send a message to stderr and exit with a failure status
# Usage:
#   error-exit ["some text to print" [exit-status]]
#
function error-exit {
        error_fn "$1"
        exit "${2:-1}"
}
function usage {
        cat <<EOF
How to use: ${programName} [-h|--help is for help ] [-w|--waittime is for waittime] [-n|--waitcount is for waitcount]
Default waittime is 1 and the waitcount is 10
EOF
}

#### Main Program

# Process command line parameters
while [ $# -gt 0 ]; do
    case $1 in
        -w | --waittime )
            shift
            sleepTime="$1"
            ;;
        -n | --waitcount)
            shift
            numberOfSleeps="$1"
            ;;
        -h | --help )
            usage
            exit
            ;;
        * )
            usage
            error-exit "$1 not a recognized option"
    esac
    shift
done

if [ ! $numberOfSleeps -gt 0 ]; then
    error-exit "$numberOfSleeps is not a valid count of sleeps to wait for signals"
fi

if [ ! $sleepTime -gt 0 ]; then
    error-exit "$sleepTime is not a valid time to sleep while waiting for signals"
fi

sleepCount=$numberOfSleeps

function interrupt_fn {
  echo "You are not allowed to interrupt the count."
  sleepCount=$((numberOfSleeps+1))
}

while [ $sleepCount -gt 0 ]; do
    echo "Waiting $sleepCount more times for signals"
    sleep $sleepTime
    sleepCount=$((sleepCount - 1))
done
echo "Wait counter expired, exiting peacefully"
