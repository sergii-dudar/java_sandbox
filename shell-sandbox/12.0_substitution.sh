#!/bin/bash

#\\ - backslash
#\a - alert (BEL)
#\b - backspace
#\c - suppress trailing newline
#\f - form feed
#\n - new line
#\r - carriage return
#\t - horizontal tab
#\v - vertical tab

a=10
echo -e "Value of a is $a \n"

#-----------Command Substitution
printf "\n"
echo "command substitution:"

DATE=$(date)
echo "Date is $DATE"

USERS=$(who | wc -l)
echo "Logged in user are $USERS"

UP=$(date ; uptime)
echo "Uptime is $UP"

echo
LS=$(ls)
echo "LS is: $LS"
