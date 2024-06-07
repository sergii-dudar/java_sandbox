#!/usr/bin/python3.12

# ========================================Remove Specified List Item
print("\n========================================|||:Remove Specified List Item")

list1 = ["Rohan", "Physics", 21, 69.75]
print("Original list: ", list1)

list1.remove("Physics")
print("List after removing: ", list1)

# ========================================Remove Specified List Item with Index
print("\n========================================|||:Remove Specified List Item with Index")

list2 = [25.50, True, -55, 1 + 2j]
print("Original list: ", list2)
list2.pop(2)
print("List after popping: ", list2)

# ========================================Remove Specified List Item Using del Keyword
print("\n========================================|||:Remove Specified List Item Using del Keyword")

list1 = ["a", "b", "c", "d"]
print("Original list: ", list1)
del list1[2]
print("List after deleting: ", list1)

# ========================================Remove Consecutive List Items
print("\n========================================|||:Remove Consecutive List Items")

list2 = [25.50, True, -55, 1 + 2j]
print("List before deleting: ", list2)
del list2[0:2]
print("List after deleting: ", list2)

# ========================================
print("\n========================================|||:")
