#!/bin/bash

#() is for subshells.
#(( )) is for arithmetic evaluations.
#[] is for basic test commands.
#[[]] is for advanced test commands with additional capabilities.

# 1. Parentheses (): Grouping Commands: Parentheses are used to group commands, allowing you to run them in a subshell.
# (command1; command2)
# (cd /tmp; ls)

# 2. Double Parentheses (( )): Arithmetic Evaluation: Double parentheses are used for arithmetic evaluation.
# if (( expression )); then
#   commands
# fi
# if (( 5 > 3 )); then
#  echo "5 is greater than 3"
#fi

# 3. Square Brackets []: Test Command: Single square brackets are used for the test command to evaluate conditional expressions.
# if [ condition ]; then
#    commands
# fi
# if [ -f /etc/passwd ]; then
#   echo "/etc/passwd exists"
# fi

# 4. Double Square Brackets [[]]: Extended Test Command: Double square brackets are an extended version of the test command with additional features like regex matching and logical operators.
# if [[ condition ]]; then
#   commands
# fi
# if [[ $var =~ ^[0-9]+$ ]]; then
#   echo "$var is a number"
# fi


#---------------------- operator [[]]
# Both [[ ]] and [ ] can be used to:
# [ -f file ] && echo "file exists"
# [[ -f file ]] && echo "file exists"

# [ "$str1" = "$str2" ] && echo "strings are equal"
# [[ "$str1" = "$str2" ]] && echo "strings are equal"

# [ "$num1" -eq "$num2" ] && echo "numbers are equal"
# [[ "$num1" -eq "$num2" ]] && echo "numbers are equal"

# Enhanced Features of [[ ]]

# Pattern Matching:
# Supports =~ for regex matching.
# Supports == and != with wildcard patterns (*, ?, etc.).
# if [[ $var =~ ^[0-9]+$ ]]; then echo "var is a number"; fi
# if [[ $var == h* ]]; then echo "var starts with 'h'"; fi

# Logical Operators:
# Supports &&, ||, and ! without the need for escaping
# if [ -f "$file" ] && [ -r "$file" ]; then echo "file exists and is readable"; fi
# if [[ -f $file && -r $file ]]; then echo "file exists and is readable"; fi

#--------------------------
# in context of condition expression (unix compatibility):
#    0 - for true
#    1 or more - fore false

# in context of ariphmetical expression:
#   1 - for true
#   0 - for false
    
var=$(( 8 > 7 ))
echo $var