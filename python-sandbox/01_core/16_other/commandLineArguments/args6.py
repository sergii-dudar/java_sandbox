#!/usr/bin/python3.12
# https://www.tutorialspoint.com/python/python_command_line_arguments.htm

import argparse

parser = argparse.ArgumentParser(description="add numbers")
parser.add_argument("first", type=int)
parser.add_argument("second", type=int)
args = parser.parse_args()
x = args.first
y = args.second
z = x + y
print('addition of {} and {} = {}'.format(x, y, z))

# py args6.py -h
# py args6.py -h 10 20
