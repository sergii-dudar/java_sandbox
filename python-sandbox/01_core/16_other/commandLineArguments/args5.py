#!/usr/bin/python3.12
# https://www.tutorialspoint.com/python/python_command_line_arguments.htm

import argparse

parser = argparse.ArgumentParser(description="sample argument parser")
parser.add_argument("user", nargs='?', default="Admin")
args = parser.parse_args()
if args.user == "Admin":
    print("Hello Admin")
else:
    print("Hello Guest")
