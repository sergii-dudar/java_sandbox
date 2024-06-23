#!/usr/bin/python3.12

# - Using a for Loop
# - Using dict.items() method
# - Using dict.keys() method
# - Using dict.values() method

# ========================================For Loop
print("\n========================================|||:For Loop")

student = {"name": "Alice", "age": 21, "major": "Computer Science"}
for key in student:
    print(key, student[key])

# ========================================dict.items() Method
print("\n========================================|||:dict.items() Method")

# Key-Value Pairs

print()
for item in student.items():
    print(item)

print()
for key, value in student.items():
    print(key, value)

# ========================================dict.keys() Method
print("\n========================================|||:dict.keys() Method")

# Looping through keys
for key in student.keys():
    print(key)

# ========================================Using dict.values() Method
print("\n========================================|||:Using dict.values() Method")

student = {"name": "Alice", "age": 21, "major": "Computer Science"}

# Looping through values
for value in student.values():
    print(value)
