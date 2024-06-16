#!/usr/bin/python3.12

# ========================================add() Method
print("\n========================================|||:add() Method")

# Defining an empty set
language = set()

# Adding elements to the set using add() method
language.add("C")
language.add("C++")
language.add("Java")
language.add("Python")

# Printing the updated set
print("Updated Set:", language)

# ========================================update() Method
print("\n========================================|||:update() Method")

# Define a set
my_set = {1, 2, 3}

# Adding element to the set
my_set.update([4])
# Print the updated set
print("Updated Set:", my_set)

print()

# Defining a set
lang1 = {"C", "C++", "Java", "Python"}
# Defining a tuple
lang2 = {"PHP", "C#", "Perl"}
lang1.update(lang2)
print(lang1)

# ========================================
print("\n========================================|||:")

set1 = set("Hello")  # create set from Sting (iterable)
set1.update("World")
print(set1)

# ========================================Add Set Items Using Union Operator
print(
    "\n========================================|||:Add Set Items Using Union Operator")
# In Python, the union operator (|) is used to perform a union operation between
# two sets. The union of two sets contains all the distinct elements present in
# either of the sets, without any duplicates.

# Defining three sets
lang1 = {"C", "C++", "Java", "Python"}
lang2 = {"PHP", "C#", "Perl"}
lang3 = {"SQL", "C#"}

# Performing union operation
combined_set1 = lang1.union(lang2)
combined_set2 = lang1 | lang2

# Print the combined set
print("Combined Set1:", combined_set1)
print("Combined Set2:", combined_set2)

# ========================================
print("\n========================================|||:")

lang1 = {"C", "C++", "Java", "Python"}
lang2 = ["PHP", "C#", "Perl"]
lang3 = lang1.union(lang2)
print(lang3)

# ========================================Add Set Items Using Set Comprehension
print(
    "\n========================================|||:Add Set Items Using Set Comprehension")

# Defining a list containing integers
numbers = [1, 2, 3, 4, 5]
# Creating a set containing squares of numbers using set comprehension
squares_set = {num ** 2 for num in numbers}
# Printing the set containing squares of numbers
print("Squares Set:", squares_set)
