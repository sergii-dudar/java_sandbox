#!/usr/bin/python3.12

list3 = [1, 2, 3, 4, 5]
print("Original list ", list3)
list3[2] = 10
print("List after changing value at index 2: ", list3)

# ========================================Change Consecutive List Items
print("\n========================================|||:Change Consecutive List Items")

list1 = ["a", "b", "c", "d"]

print("Original list: ", list1)

list2 = ['Y', 'Z']
list1[1:3] = list2

print("List after changing with sublist: ", list1)

# ========================================Change a Range of List Items
print("\n========================================|||:Change a Range of List Items")

list1 = ["a", "b", "c", "d"]
print("Original list: ", list1)
list2 = ['X', 'Y', 'Z']
list1[1:3] = list2
print("List after changing with sublist: ", list1)

# ========================================
print("\n========================================|||:")

list1 = ["a", "b", "c", "d"]
print("Original list: ", list1)
list2 = ['Z']
list1[1:3] = list2
print("List after changing with sublist: ", list1)
