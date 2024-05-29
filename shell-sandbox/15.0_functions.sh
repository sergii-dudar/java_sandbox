#!/bin/bash

#function hello() {
#  echo "Hello World - $1 $2"
#}
#hello Zara Ali

#------------ returning value

#function hello () {
#   return $(($1 + $2))
#}
# hello 2 3
# ret=$? # capture returned value of last command
# echo "Return value is $ret"

#using `return`` in a function is typically meant for returning an exit status code (an integer between 0 and 255) rather than a general output. To return a value from a function and capture it, you should use `echo` within the function and command substitution when calling the function

function hello() {
   echo $(($1 + $2))
}

result=$(hello 2 3)
echo "1. Return value is $result"
echo "2. Return value is $(hello 2 3)"

#----------------------------------------------------
echo -e "\n---------------------------Variable Scope: "

v1='A'
v2='B'

my_var() {
   local v1='C'
   v2='D'
   echo "Inside Function"
   echo "v1 is $v1."
   echo "v2 is $v2."
}

echo "Before Executing the Function"
echo "v1 is $v1."
echo "v2 is $v2."

my_var
echo "After Executing the Function"
echo "v1 is $v1."
echo "v2 is $v2."

#----------------------------------------------------
echo -e "\n---------------------------Return Values: "

print_it() {
   echo Hello "$1"
   return 5
}

print_it User
print_it Reader
echo The previous function returned a value of $?

echo -e "\n---------------------------Capture echo: "
print_it2() {
   local my_greet="Welcome to Javatpoint."
   echo "$my_greet"
}

#print_it2
my_greet="$(print_it2)"
echo "result: $my_greet"
