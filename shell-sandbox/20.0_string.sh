#!/bin/bash

str1="WelcometoJavatpoint"
str2="javatpoint"

# string comparison is typically done using = or == within [ ] or [[ ]] constructs,
# and not with (( )), which is used for arithmetic comparisons

printf "\nEqual Operator: "
#if [ $str1 = $str2 ]; then
if [[ "$str1" == "$str2" ]]; then
  echo "Both the strings are equal."
else
  echo "Strings are not equal."
fi

printf "\nNot Equal Operator: "
if [[ "$str1" != "$str2" ]]; then
  echo "Strings are not equal."
else
  echo "Strings are equal."
fi

str1="WelcometoJavatpoint"
str2="Javatpoint"
printf "\nLess than Operator-----: "
if [ $str1 \< $str2 ]; then
  echo "|$str1| is less then |$str2|"
else
  echo "|$str1| is not less then |$str2|"
fi

printf "\nGreater than Operator: "
if [ $str1 \> $str2 ]; then
  echo "|$str1| is greater then |$str2|"
else
  echo "|$str1| is less then |$str2|"
fi

printf "\nLength is greater than Zero: "
str="WelcometoJavatpoint"
# if [ -n "$str" ]; then
if [[ -n "$str" ]]; then
  echo "String is not empty"
else
  echo "String is empty"
fi

printf "\nLength is equal to Zero: "
str=""
# if [ -z "$str" ]; then
if [[ -z "$str" ]]; then
  echo "String is empty."
else
  echo "String is non-empty."
fi
