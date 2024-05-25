#!/bin/bash

# Read the user input

# echo "Enter the user name: "
# read -r first_name
# echo "The Current User Name is $first_name"

# echo
# echo "Enter other users'names: "
# read -r name1 name2 name3
# echo "$name1, $name2, $name3 are the other users."

# echo
# Read with prompt and silent
# read -r -p "username : " user_var
# read -r -sp "password : " pass_var
# echo "username : $user_var"
# echo "password : $pass_var"

echo
# Reading multiple inputs using an array (separated by spaces)
echo "Enter names : "
read -r -a names
echo "The entered names are : ${names[0]}, ${names[1]}."
