#!/usr/bin/python3.12

nested_dict = {
    "outer_key1": {"inner_key1": "value1", "inner_key2": "value2"},
    "outer_key2": {"inner_key3": "value3", "inner_key4": "value4"}
}
print(nested_dict)

# Define an empty outer dictionary============
nested_dict = {}

# Add key-value pairs to the outer dictionary
outer_keys = ["outer_key1", "outer_key2"]
for key in outer_keys:
    nested_dict[key] = {"inner_key1": "value1", "inner_key2": "value2"}
print(nested_dict)

# ========================================Adding Items to a Nested Dictionary in Python
print("\n========================================|||:Adding Items to a Nested Dictionary in Python")

students = {
    "Alice": {"age": 21, "major": "Computer Science"},
    "Bob": {"age": 20, "major": "Engineering"}
}

# Adding a new key-value pair to Alice's nested dictionary
students["Alice"]["GPA"] = 3.8

# Adding a new nested dictionary for a new student
students["Charlie"] = {"age": 22, "major": "Mathematics"}

print(students)

# ========================================Accessing Items of a Nested Dictionary in Python
print("\n========================================|||:Accessing Items of a Nested Dictionary in Python")

# Define a nested dictionary
students = {
    "Alice": {"age": 21, "major": "Computer Science"},
    "Bob": {"age": 20, "major": "Engineering"},
    "Charlie": {"age": 22, "major": "Mathematics"}
}

# Access Alice's major
alice_major = students["Alice"]["major"]
print("Alice's major:", alice_major)

# Access Bob's age
bob_age = students["Bob"]["age"]
print("Bob's age:", bob_age)

# ========================================Using the get() Method
print("\n========================================|||:Using the get() Method")

# Access Alice's major using .get()
alice_major = students.get("Alice", {}).get("major", "Not Found")
print("Alice's major:", alice_major)

# Safely access a non-existing key using .get()
dave_major = students.get("Dave", {}).get("major", "Not Found")
print("Dave's major:", dave_major)

# ========================================Iterating Through a Nested Dictionary in Python
print("\n========================================|||:Iterating Through a Nested Dictionary in Python")

# Iterating through the Nested Dictionary:
for student, details in students.items():
    print(f"Student: {student}")
    for key, value in details.items():
        print(f"  {key}: {value}")

# ========================================Deleting a Dictionary from a Nested Dictionary
print("\n========================================|||:Deleting a Dictionary from a Nested Dictionary")

# Delete the dictionary for Bob
del students["Bob"]

# Print the updated nested dictionary
print(students)
