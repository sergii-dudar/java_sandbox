#!/bin/bash

ifEmptyThen=${zero:+$plus} # something like ternam opartor
echo "if empty them : $ifEmptyThen"
echo

# Using if-else on a single line
condition=true
result=$(if [[ $condition ]]; then echo "Condition is true"; else echo "Condition is false"; fi)
echo "the result if else: $result"
echo

string1="hello"
string2="world"
# Check which string is longer
result=$(if [[ ${#string1} -gt ${#string2} ]]; then echo "$string1"; else echo "$string2"; fi)
echo "The longer string is: $result"
echo

# Another example using inline command substitution
num=5
result=$((num > 3 ? 1 : 0))
echo "Result of (num > 3 ? 1 : 0): $result" # Output: 1
echo

# Using && and || for simple boolean checks
condition=true
#result=$condition && "Condition is true" || "Condition is false"
result=$($condition && echo "Condition is true")
echo "conditions && and ||: $result" # Output: 1
echo

# costom function
function ternary() {
    #if [[ $1 == true ]]; then echo "$2"; else echo "$3"; fi
    # or
    if $1; then echo "$2"; else echo "$3"; fi
}
result=$(ternary true "Condition is true" "Condition is false")
echo "custom function: $result"
