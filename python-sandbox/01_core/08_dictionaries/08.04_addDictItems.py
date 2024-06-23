#!/usr/bin/python3.12

# Add Dictionary Items
# - Using square brackets
# - Using the update() method
# - Using a comprehension
# - Using unpacking
# - Using the Union Operator
# - Using the |= Operator
# - Using setdefault() method
# - Using collections.defaultdict() method

from collections import defaultdict

# ========================================Using Square Brackets
print("\n========================================|||:Using Square Brackets")

marks = {"Savita": 67, "Imtiaz": 88, "Laxman": 91, "David": 49}
print("Initial dictionary: ", marks)
marks['Kavya'] = 58
print("Dictionary after new addition: ", marks)

# ========================================Using the update() Method
print("\n========================================|||:Using the update() Method")

marks = {"Savita": 67, "Imtiaz": 88}
print("Initial dictionary: ", marks)
marks.update({'Kavya': 58, 'Mohan': 98})
print("Dictionary after new addition: ", marks)

# ========================================Using Unpacking
print("\n========================================|||:Using Unpacking")

# Unpacking in Python refers to extracting individual elements from a collection, such as a list, tuple,
# or dictionary, and assigning them to variables in a single statement. This can be done using the * operator
# for iterables like lists and tuples, and the ** operator for dictionaries.

# We can add dictionary items using unpacking by combining two or more dictionaries with the ** unpacking operator.

marks = {"Savita": 67, "Imtiaz": 88, "Laxman": 91, "David": 49}
print("marks dictionary before update: \n", marks)
marks1 = {"Sharad": 51, "Mushtaq": 61, "Laxman": 89}
newmarks = {**marks, **marks1}
print("marks dictionary after update: \n", newmarks)

# ========================================Using the Union Operator (|)
print("\n========================================|||:Using the Union Operator (|)")

marks = {"Savita": 67, "Imtiaz": 88, "Laxman": 91, "David": 49}
print("marks dictionary before update: \n", marks)
newmarks = marks | {"Sharad": 51, "Mushtaq": 61, "Laxman": 89}
print("marks dictionary after update: \n", newmarks)

# ========================================Using the "|=" Operator
print("\n========================================|||:Using the |= Operator")

marks = {"Savita": 67, "Imtiaz": 88, "Laxman": 91, "David": 49}
print("marks dictionary before update: \n", marks)
marks |= {"Sharad": 51, "Mushtaq": 61, "Laxman": 89}
print("marks dictionary after update: \n", marks)

# ========================================Using the setdefault() Method
print("\n========================================|||:Using the setdefault() Method")

# The setdefault() method in Python is used to get the value of a specified key in a dictionary.
# If the key does not exist, it inserts the key with a specified default value.

student = {"name": "Alice", "age": 21}
major = student.setdefault("major", "Computer Science")
print(student)

# ========================================Using the collections.defaultdict() Method
print("\n========================================|||:Using the collections.defaultdict() Method")

# Using int as the default factory to initialize missing keys with 0
d = defaultdict(int)
# Incrementing the value for key 'a'
d["a"] += 1
print(d)

# Using list as the default factory to initialize missing keys with an empty list
d = defaultdict(list)
# Appending to the list for key 'b'
d["b"].append(1)
print(d)


# Using a custom function as the default factory
def default_value():
    return "N/A"


d = defaultdict(default_value)
print(d["c"])
