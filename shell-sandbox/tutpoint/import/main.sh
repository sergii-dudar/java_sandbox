#!/bin/bash

# Source the library script
#''. ./library.sh' or 'source ./library.sh'
#source "$(pwd)/shell-sandbox/tutpoint/import/library.sh" # for debug in vscode or:
source ./shell-sandbox/tutpoint/import/library.sh

# Use the variable
echo "var is: $greeting"

# Call the function
echo -n "func call: "
say_hello
