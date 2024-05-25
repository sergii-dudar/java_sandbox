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

function hello () {
   echo $(($1 + $2))
}

result=$(hello 2 3)
echo "1. Return value is $result"
echo "2. Return value is $(hello 2 3)"
