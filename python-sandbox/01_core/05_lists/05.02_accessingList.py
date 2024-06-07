#!/usr/bin/python3.12

list1 = ["Rohan", "Physics", 21, 69.75]
list2 = [1, 2, 3, 4, 5]

print("Item at 0th index in list1: ", list1[0])
print("Item at index 2 in list2: ", list2[2])

# ========================================Access List Items With Negative Indexing
print("\n========================================|||:Access List Items With Negative Indexing")

list1 = ["a", "b", "c", "d"]
list2 = [25.50, True, -55, 1 + 2j]

print("Item at 0th index in list1: ", list1[-1])
print("Item at index 2 in list2: ", list2[-3])

# ========================================Access Sub List from a List
print("\n========================================|||:Access Sub List from a List")

list1 = ["a", "b", "c", "d"]
list2 = [25.50, True, -55, 1 + 2j]
list4 = ["Rohan", "Physics", 21, 69.75]
list3 = [1, 2, 3, 4, 5]

print("Items from index 1 to 2 in list1: ", list1[1:3])
print("Items from index 0 to 1 in list2: ", list2[0:2])

print("Items from index 1 to last in list1: ", list1[1:])
print("Items from index 0 to 1 in list2: ", list2[:2])
print("Items from index 2 to last in list3", list3[2:-1])
print("Items from index 0 to index last in list4", list4[:])
