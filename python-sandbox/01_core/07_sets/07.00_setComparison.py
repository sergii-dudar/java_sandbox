#!/usr/bin/python3.12

# ==: checks if two sets have the same elements, regardless of their order.
# !=: checks if two sets are not equal.
# <: checks if the left set is a proper subset of the right set (i.e., all elements in the left set are also in the right set, but the right set has additional elements).
# <=: checks if the left set is a subset of the right set (i.e., all elements in the left set are also in the right set).
# >: checks if the left set is a proper superset of the right set (i.e., all elements in the right set are also in the left set, but the left set has additional elements).
# >=: checks if the left set is a superset of the right set (i.e., all elements in the right set are also in the left).

Days1 = {"Monday", "Tuesday", "Wednesday", "Thursday"}
Days2 = {"Monday", "Tuesday"}
Days3 = {"Monday", "Tuesday", "Friday"}

# Days1 is the superset of Days2 hence it will print true.
print(Days1 > Days2)

# prints false since Days1 is not the subset of Days2
print(Days1 < Days2)

# prints false since Days2 and Days3 are not equivalent
print(Days2 == Days3)

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")
