#!/usr/bin/python3.12
# https://www.tutorialspoint.com/python/python_command_line_arguments.htm

import sys

print('argument list', sys.argv)
first = int(sys.argv[1])
second = int(sys.argv[2])
print("sum = {}".format(first + second))

# py args2.py 10 20
