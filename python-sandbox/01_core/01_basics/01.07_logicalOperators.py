#!/usr/bin/python3.12

# ======================================== Logical Operators With Boolean Conditions
print("\n========================================|||Logical Operators With Boolean Conditions:")

x = 10
y = 20
print("x > 0 and x < 10:", x > 0 and x < 10)
print("x > 0 and y > 10:", x > 0 and y > 10)
print("x > 10 or y > 10:", x > 10 or y > 10)
print("x%2 == 0 and y%2 == 0:", x % 2 == 0 and y % 2 == 0)
print("not (x+y>15):", not (x + y) > 15)

# ======================================== Logical Operators With Non- Boolean Conditions
print("\n========================================|||Logical Operators With Non- Boolean Conditions:")

# We can use non-boolean operands with logical operators. Here, we need to not that any non-zero numbers,
# and non-empty sequences evaluate to True.


x = 10
y = 20
z = 0
print("x and y:", x and y)
print("x or y:", x or y)
print("z or x:", z or x)
print("y or z:", y or z)

# ======================================== Logical Operators With Strings and Tuples
print("\n========================================|||Logical Operators With Strings and Tuples:")
# The string variable is treated as True and an empty tuple as False in the following example

a = "Hello"
b = tuple()
print("a and b:", a and b)
print("b or a:", b or a)

# ======================================== Logical Operators With Lists
print("\n========================================|||Logical Operators With Lists:")

x = [1, 2, 3]
y = [10, 20, 30]
print("x and y:", x and y)
print("x or y:", x or y)
