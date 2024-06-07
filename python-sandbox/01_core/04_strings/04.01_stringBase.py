#!/usr/bin/python3.12

print("My name is %s and weight is %d kg!" % ('Zara', 21))

# ======================================== Double Quotes in Python Strings
print("\n========================================|||: Double Quotes in Python Strings")

var = 'Welcome to "Python Tutorial" from TutorialsPoint'
print("var:", var)

var = "Welcome to 'Python Tutorial' from TutorialsPoint"
print("var:", var)

# ======================================== Triple Quotes
print("\n========================================|||: Triple Quotes")

var = '''Welcome to TutorialsPoint'''
print("var:", var)

var = """Welcome to TutorialsPoint"""
print("var:", var)

var = '''
Welcome To
Python Tutorial
from TutorialsPoint
'''
print("var:", var)

# ======================================== String Special Operators
print("\n========================================|||: String Special Operators")

a = 'Hello'
b = 'Python'

print(a + b)  # will give HelloPython
print(a * 2)  # will give -HelloHello
print(a[1])  # will give e
print(a[1:4])  # will give ell
print('H' in a)  # will give 1
print('M' not in a)  # will give 1

# ======================================== join()
print("\n========================================|||: join()")