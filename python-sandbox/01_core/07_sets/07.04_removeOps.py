#!/usr/bin/python3.12

my_set = {"Rohan", "Physics", 21, 69.75}
print("Original set: ", my_set)

# my_set.remove("Physics")
# my_set.remove("PHP")  # error as not exists, if not need error, use discard()
my_set.discard("Physics")
my_set.discard("PHP")

print("Set after removing: ", my_set)

# ========================================pop()
print("\n========================================|||:pop()")
# If the set is empty, the pop() method will raise a KeyError exception.

# Defining a set
my_set = {1, 2, 3, 4, 5}

# removing and returning an arbitrary element from the set
removed_element = my_set.pop()

# Printing the removed element and the updated set
print("Removed Element:", removed_element)
print("Updated Set:", my_set)

# ========================================clear()
print("\n========================================|||:clear()")

# Defining a set with multiple elements
my_set = {1, 2, 3, 4, 5}

# Removing all elements from the set
my_set.clear()
# Printing the updated set
print("Updated Set:", my_set)


set1 = {1, 2, 3, 4, 5}
set2 = {4, 5, 6, 7, 8}


# ========================================difference_update
print(
    "\n========================================|||:difference_update")
# return all in first set, except items in second set

s1 = set(set1)
s2 = set(set2)

print("s1: ", s1, "s2: ", s2)
print("s1 before running difference_update: ", s1)
s1.difference_update(s2)
print("s1 after running difference_update: ", s1)

# ========================================symmetric difference operator (^)
print(
    "\n========================================|||:symmetric difference operator (^)")
# symmetric difference operator (^)

s1 = set(set1)
s2 = set(set2)

print("s1: ", s1, "s2: ", s2)
# Removing items that exist in both sets
result_set = s1 ^ s2
print("Resulting Set:", result_set)  # 1, 2, 5, 6

# ========================================intersection_update
print("\n========================================|||:intersection_update")
# intersection

s1 = set(set1)
s2 = set(set2)

print("s1: ", s1, "s2: ", s2)
# Keeping only common items in set1
s1.intersection_update(set2)
print("Set 1 after keeping only common items:", s1)

# ========================================intersection
print("\n========================================|||:intersection")

s1 = set(set1)
s2 = set(set2)

print("s1: ", s1, "s2: ", s2)
s3 = s1.intersection(s2)
print("s3 = s1 & s2: ", s3)

# ========================================symmetric_difference_update
print(
    "\n========================================|||:symmetric_difference_update")

s1 = set(set1)
s2 = set(set2)
print("s1: ", s1, "s2: ", s2)
s1.symmetric_difference_update(s2)
print("s1 after running symmetric difference ", s1)

# ========================================symmetric_difference
print(
    "\n========================================|||:symmetric_difference")

s1 = set(set1)
s2 = set(set2)
print("s1: ", s1, "s2: ", s2)
s3 = s1.symmetric_difference(s2)
print("s1 = s1^s2 ", s3)
