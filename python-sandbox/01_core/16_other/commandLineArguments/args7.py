#!/usr/bin/python3.12
# https://www.tutorialspoint.com/python/python_command_line_arguments.htm

import argparse

parser = argparse.ArgumentParser()
parser.add_argument("name")
parser.add_argument("--surname")
args = parser.parse_args()
print("My name is ", args.name, end=' ')
if args.surname:
    print(args.surname)

# py args6.py -h
# py args6.py Anup --surname Gupta
