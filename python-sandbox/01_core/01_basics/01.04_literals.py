#!/usr/bin/python3.12


# String Literal
var1 = 'hello'
print("'hello' in single quotes is:", var1, type(var1))
var2 = "hello"
print('"hello" in double quotes is:', var1, type(var1))
var3 = '''hello'''
print("''''hello'''' in triple quotes is:", var1, type(var1))
var4 = """hello"""
print('"""hello""" in triple quotes is:', var1, type(var1))

var1 = 'Welcome to "Python Tutorial" from TutorialsPoint'
print(var1)
var2 = "Welcome to 'Python Tutorial' from TutorialsPoint"
print(var2)

# list literals
print()
L1 = [1, "Ravi", 75.50, True]
print(L1, type(L1))

# Tuple Literal
print()
T1 = (1, "Ravi", 75.50, True)
print(T1, type(T1))

# Tuple Type Literal Without Parenthesis
print()
T1 = 1, "Ravi", 75.50, True
print(T1, type(T1))

# Dictionary Literal
print()
capitals = {"USA": "New York", "France": "Paris", "Japan": "Tokyo",
            "India": "New Delhi"}
numbers = {1: "one", 2: "Two", 3: "three", 4: "four"}
points = {"p1": (10, 10), "p2": (20, 20)}

print(capitals, type(capitals))
print(numbers, type(numbers))
print(points, type(points))
