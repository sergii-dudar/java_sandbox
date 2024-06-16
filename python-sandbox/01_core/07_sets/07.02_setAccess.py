#!/usr/bin/python3.12

import itertools

# ========================================loop
print("\n========================================|||:loop")

# Defining a set
langs = {"C", "C++", "Java", "Python"}

# Accessing set items using a for loop
for lang in langs:
    print(lang)

# ========================================List Comprehension
print("\n========================================|||:List Comprehension")

my_set = {1, 2, 3, 4, 5}
# Accessing set items using list comprehension
accessed_items = [item for item in my_set]
print(accessed_items)

# ========================================Access Subset From a Set
print("\n========================================|||:Access Subset From a Set")

# Defining a set
original_set = {1, 2, 3, 4}

# Checking if {1, 2} is a subset of the original set
is_subset = {1, 2}.issubset(original_set)
print("{1, 2} is a subset of the original set:", is_subset)

# Generating all subsets with two elements
subsets_with_two_elements = [set(subset) for subset in
                             itertools.combinations(original_set, 2)]
print("Subsets with two elements:", subsets_with_two_elements)

# ========================================Checking if Set Item Exists
print(
    "\n========================================|||:Checking if Set Item Exists")

# Defining a set
langs = {"C", "C++", "Java", "Python"}

# Checking if an item exists in the set
if "Java" in langs:
    print("Java is present in the set.")
else:
    print("Java is not present in the set.")

# Checking if an item does not exist in the set
if "SQL" not in langs:
    print("SQL is not present in the set.")
else:
    print("SQL is present in the set.")
