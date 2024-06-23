#!/usr/bin/python3.12
# https://www.tutorialspoint.com/python/python_command_line_arguments.htm

import argparse

# parser = argparse.ArgumentParser(description="sample argument parser")
# args = parser.parse_args()

parser = argparse.ArgumentParser(description="sample argument parser")
parser.add_argument("user")
args = parser.parse_args()
if args.user == "Admin":
    print("Hello Admin")
else:
    print("Hello Guest")

# python args4.py Admin
# Hello Admin

# python args4.py Rajan
# Hello Guest
