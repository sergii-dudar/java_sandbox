#!/bin/bash

notEmptyString="asdfasd"
emptyString=""

if [[ $notEmptyString == "$emptyString" ]]; then
  echo '$notEmptyString == "$emptyString" is true'
else
  echo '$notEmptyString == "$emptyString" is false'
fi

if [[ $notEmptyString != "$emptyString" ]]; then
  echo '$notEmptyString == "$emptyString" is true'
else
  echo '$notEmptyString == "$emptyString" is false'
fi

#-z	Checks if the given string operand size is zero; if it is zero length, then it returns true.	[ -z $a ] is not true.
if [[ -z $emptyString ]]; then
  echo '-z $emptyString is zero'
else
  echo '-z $emptyString is NOT zero'
fi

#-n	Checks if the given string operand size is non-zero; if it is nonzero length, then it returns true.	[ -n $a ] is not false.
if [[ -n $notEmptyString ]]; then
  echo '-n $notEmptyString is NOT zero'
else
  echo '-n $notEmptyString is zero'
fi

#str	Checks if str is not the empty string; if it is empty, then it returns false.	[ $a ] is not false.
if [[ $notEmptyString ]]; then
  echo '-n $emptyString is NOT zero'
fi

if [[ ! $emptyString ]]; then
  echo '-n ! $emptyString is zero'
fi
