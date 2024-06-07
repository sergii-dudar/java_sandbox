#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/string_formatting_operator.htm

print("My name is %s and weight is %d kg!" % ('Zara', 21))

print("\n========================================|||:")
name = "Rajesh"
age = 23
print("my name is %s and my age is %d years" % (name, age))

print("\n========================================|||:")
a = 1
b = 11
c = 111
print("a=%5d b=%5d c=%5d" % (a, b, c))

print("\n========================================|||:")
name = "Rajesh"
age = 23
percent = 55.50
print("my name is %s, age %d and I have scored %6.3f percent marks" % (name, age, percent))

print("\n========================================|||:")
name = 'TutorialsPoint'
print('Welcome To %20s The largest Tutorials Library' % (name,))
print('Welcome To %-20s The largest Tutorials Library' % (name,))
