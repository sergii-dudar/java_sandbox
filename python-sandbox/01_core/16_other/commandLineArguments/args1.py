#!/usr/bin/python3.12
# https://www.tutorialspoint.com/python/python_command_line_arguments.htm

import sys

print('argument list', sys.argv)
name = sys.argv[1]
print("Hello {}. How are you?".format(name))

# python args1.py Rajan
