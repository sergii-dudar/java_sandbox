#!/bin/bash

# ${var} Substitute the value of var.

#-------------------------------------
#--- ${var:-word} If var is null or unset, word is substituted for var. The value of var does not change.
# var2=${var1:-"Variable is not set"}
# echo "\$var1 is: $var1" #
# echo "\$var2 is: $var2" #Variable is not set

#-------------------------------------
#--- ${var:=word} If var is null or unset, var is set to the value of word.
# var2=${var1:="Variable is not set"}
# echo "\$var1 is: $var1" #Variable is not set
# echo "\$var2 is: $var2" #Variable is not set

#-------------------------------------
#--- ${var:+word} If var is set, word is substituted for var. The value of var does not change.
# var2=${var1:+"This is default value"}
# echo "\$var1 is: $var1" #
# echo "\$var2 is: $var2" #

#var1="original var1 value"
#var2=${var1:+"This is default value"}
#echo "\$var1 is: $var1" #original var1 value
#echo "\$var2 is: $var2" #This is default value

#-------------------------------------
#--- ${var:?message} If var is null or unset, message is printed to standard error. This checks that variables are set correctly.
# var2=${var1:?"Print this message"}
# echo "\$var1 is: $var1" #
# echo "\$var2 is: $var2" #...12.1variableSubstitution.sh: line 30: var1: Print this message

var1="original var1 value"
var2=${var1:?"Print this message"}
echo "\$var1 is: $var1" #original var1 value
echo "\$var2 is: $var2" #original var1 value
