#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_packages.htm

# The package is a folder containing one or more module files;
# additionally, a special file "__init__.py" file may be empty but may
# contain the package list.

from mypackage.areafunctions import rectangle
from mypackage.mathfunctions import average

print("Area :", rectangle(10, 20))
print("average:", average(10, 20))

# ========================================# Define Package List in __init__
print(
    "\n========================================|||:# Define Package List in __init__")

# from mypackage2 import sum, power # not working by some issue
from mypackage2.mathfunctions import sum, power

print("Area of circle:", sum(5, 10))
print("10 raised to 2:", power(10, 2))
