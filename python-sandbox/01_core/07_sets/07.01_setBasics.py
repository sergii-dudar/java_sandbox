#!/usr/bin/python3.12

s1 = {"Rohan", "Physics", 21, 69.75}
s2 = {1, 2, 3, 4, 5}
s3 = {"a", "b", "c", "d"}
s4 = {25.50, True, -55, 1 + 2j}
print(s1)
print(s2)
print(s3)
print(s4)
print()

L1 = ["Rohan", "Physics", 21, 69.75]
s1 = set(L1)
T1 = (1, 2, 3, 4, 5)
s2 = set(T1)
string = "TutorialsPoint"
s3 = set(string)

print(s1)
print(s2)
print(s3)
print()

s2 = {1, 2, 3, 4, 5, 3, 0, 1, 9}
s3 = {"a", "b", "c", "d", "b", "e", "a"}
print(s2)
print(s3)
print()

# error, only immutables
# s1 = {1, 2, [3, 4, 5], 3, 0, 1, 9}
# print(s1)
# s2 = {"Rohan", {"phy": 50}}
# print(s2)

# ========================================Copy Sets
print("\n========================================|||:Copy Sets")

lang1 = {"C", "C++", "Java", "Python"}
print("lang1: ", lang1, "id(lang1): ", id(lang1))
lang2 = lang1.copy()
print("lang2: ", lang2, "id(lang2): ", id(lang2))
lang1.add("PHP")
print("After updating lang1")
print("lang1: ", lang1, "id(lang1): ", id(lang1))
print("lang2: ", lang2, "id(lang2): ", id(lang2))

# ========================================Copy Sets Using the set() Function
print(
    "\n========================================|||:Copy Sets Using the set() Function")

# Original set
original_set = {1, 2, 3, 4}
# Copying the set using the set() function
copied_set = set(original_set)  # from iterable
print("copied set:", copied_set)

# Demonstrating that the sets are independent
copied_set.add(5)
print("copied set:", copied_set)
print("original set:", original_set)

# ========================================Copy Sets Using Set Comprehension
print(
    "\n========================================|||:Copy Sets Using Set Comprehension")

# Original set
original_set = {1, 2, 3, 4, 5}

# Copying the set using set comprehension
copied_set = {x for x in original_set}
print("Copied set:", copied_set)
