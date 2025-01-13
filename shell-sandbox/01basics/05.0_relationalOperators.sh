#!/bin/bash

a=10
b=20

#-eq	Checks if the value of two operands are equal or not; if yes, then the condition becomes true.
if [[ $a == "$b" ]]; then
  echo '$a == $b is true'
else
  echo '$a == $b is false'
fi

if [[ $a -eq $b ]]; then
  echo '$a -eq $b is true'
else
  echo '$a -eq $b is false'
fi

#-ne	Checks if the value of two operands are equal or not; if values are not equal, then the condition becomes true.
if [[ $a != "$b" ]]; then
  echo '$a != $b is true'
else
  echo '$a != $b is false'
fi

if [[ $a -ne $b ]]; then
  echo '$a -ne $b is true'
else
  echo '$a -ne $b is false'
fi

#-gt	Checks if the value of left operand is greater than the value of right operand; if yes, then the condition becomes true.
#if [[ $a > $b ]]; then
if [[ $a -gt $b ]]; then
  echo '$a > $b is true'
else
  echo '$a > $b is false'
fi

#-lt	Checks if the value of left operand is less than the value of right operand; if yes, then the condition becomes true.
#lt=$(( $a < $b )) # is true.
if [[ $a -lt $b ]]; then
  echo '$a < $b is true'
else
  echo '$a < $b is false'
fi

#-ge	Checks if the value of left operand is greater than or equal to the value of right operand; if yes, then the condition becomes true.
#ge=$(( $a >= $b )) # is not true.
if [[ $a -ge $b ]]; then
  echo '$a >= $b is true'
else
  echo '$a >= $b is false'
fi


#-le	Checks if the value of left operand is less than or equal to the value of right operand; if yes, then the condition becomes true.
#le=$(( $a <= $b )) # is true.
if [[ $a -le $b ]]; then
  echo '$a <= $b is true'
else
  echo '$a <= $b is false'
fi

if [[ $a -ge $b || $a -le $b ]]; then
  echo '$a -ge $b || $a -le $b is true'
else
  echo '$a -ge $b || $a -le $b is false'
fi

#if [[ $a -ge $b -o $a -le $b ]]; then
if [[ $a -ge $b || $a -le $b ]]; then
  echo '$a -ge $b || $a -le $b is true'
else
  echo '$a -ge $b || $a -le $b is false'
fi

#if [[ $a -ge $b -a $a -le $b ]]; then
if [[ $a -ge $b && $a -le $b ]]; then
  echo '$a -ge $b && $a -le $b is true'
else
  echo '$a -ge $b && $a -le $b is false'
fi
