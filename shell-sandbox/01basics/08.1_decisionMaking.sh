#!/bin/bash

#----if expression Options
# ! EXPRESSION -	To check if EXPRESSION is false.
# -n STRING -	To check if the length of STRING is greater than zero.
# -z STRING -	To check if the length of STRING is zero (i.e., it is empty)
# STRING1 == STRING2  -	To check if STRING1 is equal to STRING2.
# STRING1 != STRING2  -	To check if STRING1 is not equal to STRING2.
# INTEGER1 -eq INTEGER2 -	To check if INTEGER1 is numerically equal to INTEGER2.
# INTEGER1 -gt INTEGER2 -	To check if INTEGER1 is numerically greater than INTEGER2.
# INTEGER1 -lt INTEGER2 -	To check if INTEGER1 is numerically less than INTEGER2.
# -d FILE -	To check if FILE exists and it is a directory.
# -e FILE -	To check if FILE exists.
# -r FILE -	To check if FILE exists and the read permission is granted.
# -s FILE -	To check if FILE exists and its size is greater than zero (which means that it is not empty).
# -w FILE -	To check if FILE exists and the write permission is granted.
# x FILE -	To check if FILE exists and the execute permission is granted.

# TRUE && TRUE
if [ 8 -gt 6 ] && [ 10 -eq 10 ]; then
  echo "Conditions are true"
fi

# TRUE && FALSE
if [ "mylife" == "mylife" ] && [ 3 -gt 10 ]; then
  echo "Conditions are false"
fi

#--------------------------------

# TRUE || FALSE
if [ 8 -gt 7 ] || [ 10 -eq 3 ]; then
  echo " Condition is true. "
fi

# FALSE || FALSE
if [ "mylife" == "yourlife" ] || [ 3 -gt 10 ]; then
  echo " Condition is false. "
fi

#-------------------------------

# TRUE && FALSE || FALSE || TRUE
if [[ 10 -eq 10 && 5 -gt 4 || 3 -eq 4 || 3 -lt 6 ]]; then
  echo "Condition is true."
fi

# TRUE && FALSE || FALSE
if [[ 8 -eq 8 && 8 -gt 10 || 9 -lt 5 ]]; then
  echo "Condition is false"
fi

#------------------Nested If

num=3
if [ $num -gt 50 ]; then
  echo "Number is greater than 50."

  if (($1 % 2 == 0)); then
    echo "and it is an even number."
  fi
fi

#-------------------------------
#-------------- if else

# When condition is true
# TRUE && FALSE || FALSE || TRUE
if [[ 10 -gt 9 && 10 == 9 || 2 -lt 1 || 25 -gt 20 ]]; then
  echo "Given condition is true."
else
  echo "Given condition is false."
fi

# When condition is false
#TRUE && FALSE || FALSE || TRUE
if [[ 10 -gt 9 && 10 == 8 || 3 -gt 4 || 8 -gt 8 ]]; then
  echo "Given condition is true."
else
  echo "Given condition is not true."
fi

#------------- single line

value=4
if [ $value -gt 9 ]; then echo "The value you typed is greater than 9."; else echo "The value you typed is not greater than 9."; fi

#-------------------------------
#-------------- if else if

num=100
if [ $num -gt 200 ]; then

  echo "Eligible for 20% discount"

elif [[ $num == 200 || $num == 100 ]]; then

  echo "Lucky Draw Winner"
  echo "Eligible to get the item for free"

elif [[ $num -gt 100 && $num -lt 200 ]]; then

  echo "Eligible for 10% discount"

elif [ $num -lt 100 ]; then

  echo "No discount"

fi

#-------------------------------
#-------------- Logical combinations

VAR_A=(10)
VAR_B=3
VAR_T=2
if [[ ${VAR_A[0]} -eq 1 && ($VAR_B = "bee" || $VAR_T = "tee") ]]; then
#if ((VAR_A[0] == 1 && (VAR_B == "bee" || VAR_T == "tee"))); then
  echo "multiple true"
else
  echo "multiple false"
fi

#-------------------------------
#-------------- bash case

echo "Do you know Java Programming?"
#read -p "Yes/No? :" Answer
Answer="yes"
case $Answer in
Yes | yes | y | Y)
  echo "That's amazing."
  echo
  ;;
No | no | N | n)
  echo "It's easy. Let's start learning from javatpoint."
  ;;
esac

#-----------

echo "Which Operating System are you using?"
echo "Windows, Android, Chrome, Linux, Others?"
#read -p "Type your OS Name:" OS
OS=linux

case $OS in
Windows | windows)
  echo "That's common. You should try something new."
  echo
  ;;
Android | android)
  echo "This is my favorite. It has lots of applications."
  echo
  ;;
Chrome | chrome)
  echo "Cool!!! It's for pro users. Amazing Choice."
  echo
  ;;
Linux | linux)
  echo "You might be serious about security!!"
  echo
  ;;
*)
  echo "Sounds interesting. I will try that."
  echo
  ;;
esac

#simple case bash structure
echo "--------------simple case bash structure"
mycase=1
case $mycase in
1) echo "You selected bash" ;;
2) echo "You selected perl" ;;
3) echo "You selected phyton" ;;
4) echo "You selected c++" ;;
5) exit ;;
esac
