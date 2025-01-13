#!/bin/bash

printf "\n---------#Check whether a variable is set or not using -v option "

A=100
#A: variable is set.
if [[ -v A ]]; then
  echo "Variable having name 'A' is set."
else
  echo "Variable having name 'A' is not set."
fi

#B: variable is not set
if [[ -v B ]]; then
  echo "Variable having name 'B' is set."
else
  echo "Variable having name 'B' is not set."
fi

printf "\n---------#Check whether a variable is set or not using -z option "

#A: variable is set.
if [[ -z ${A} ]]; then
  echo "Variable having name 'A' is not set."
else
  echo "Variable having name 'A' is set."
fi

#B: variable is not set
if [[ -z ${B} ]]; then
  echo "Variable having name 'B' is not set."
else
  echo "Variable having name 'B' is set."
fi

#-----------------------------------------
printf "\n---------#Check whether a variable is set or not using -z option2 "

VAR=''

#VAR is set

if [ -z ${VAR+x} ]; then
  echo "'VAR' is unset"
else
  echo "'VAR' is set, its content is '$VAR'"
fi

#Var is not set
if [ -z ${Var+x} ]; then
  echo "'Var' is unset"
else
  echo "'Var' is set, its content is '$Var'"
fi
