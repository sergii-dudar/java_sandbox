#!/usr/bin/python3.12

import copy

# ========================================Shallow Copy
print("\n========================================|||:Shallow Copy")

original_dict = {"name": "Alice", "age": 25, "skills": ["Python", "Data Science"]}
shallow_copy = original_dict.copy()

# Modifying the shallow copy
shallow_copy["age"] = 26
shallow_copy["skills"].append("Machine Learning")

print("Original dictionary:", original_dict)
print("Shallow copy:", shallow_copy)

# ========================================Using the dict() Method
print("\n========================================|||:Using the dict() Method")

original_dict = {"name": "Bob", "age": 30, "skills": ["Java", "C++"]}
shallow_copy = dict(original_dict)

# Modifying the shallow copy
shallow_copy["age"] = 31
shallow_copy["skills"].append("C#")

print("Original dictionary:", original_dict)
print("Shallow copy:", shallow_copy)

# ========================================Deep Copy
print("\n========================================|||:Deep Copy")

original_dict = {
    "name": "Alice",
    "age": 25,
    "skills": ["Python", "Data Science"],
    "education": {
        "degree": "Bachelor's",
        "field": "Computer Science"
    }
}

# Creating a deep copy
deep_copy = copy.deepcopy(original_dict)

# Modifying the deep copy
deep_copy["age"] = 26
deep_copy["skills"].append("Machine Learning")
deep_copy["education"]["degree"] = "Master's"

# Retrieving both dictionaries
print("Original dictionary:", original_dict)
print("Deep copy:", deep_copy)

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")
