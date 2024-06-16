#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_set_operators.htm

# ========================================Union Operator (|)
print("\n========================================|||:Union Operator (|)")

set1 = {1, 2, 3, 4, 5, 6, 7}
set2 = {5, 6, 7, 8, 9, 9, 45, 73}
union_set1 = set1.union(set2)
union_set2 = set1 | set2

print("set1: ", set1, "set2: ", set2)
print(union_set1, 'The union of: set1 | set2 is')
print(union_set2, 'The union of: set3 .union set4 is')

# ========================================Intersection Operator (&)
print("\n========================================|||:Intersection Operator (&)")

intersection_set1 = set(set1).intersection(set(set2))
intersection_set2 = set1 & set2

print("set1: ", set1, "set2: ", set2)
print(intersection_set1, 'The intersection of: set1 .intersection set2 is')
print(intersection_set2, 'The intersection of: set3 & set4 is')

# ========================================Difference Operator (except) (-)
print(
    "\n========================================|||:Difference Operator (except) (-)")

difference_set1 = set1.difference(set2)
difference_set2 = set1 - set2
print("set1: ", set1, "set2: ", set2)

print(difference_set1, 'The difference between: set1 .difference set2 is')
print(difference_set2, 'The difference between: set3 - set4 is')

# ========================================Symmetric Difference Operator (^)
print(
    "\n========================================|||:Symmetric Difference Operator (^)")

symmetric_difference_set1 = set1.symmetric_difference(set2)
symmetric_difference_set2 = set1 ^ set2

print("set1: ", set1, "set2: ", set2)
print(symmetric_difference_set1,
      'The symmetric difference of: set1 .symmetric_difference set2 is')
print(symmetric_difference_set2, 'The symmetric difference of: set3 ^ set4 is')

# ========================================Subset Testing Operation (<=)
print(
    "\n========================================|||:Subset Testing Operation (<=)")

subTrueSet1 = {1, 2, 3, 4}
subFalseSet1 = {6, 7, 9}

print("subTrueSet1: ", subTrueSet1, " in set1: ", set1)
is_subset1 = subTrueSet1.issubset(set1)
is_subset2 = subTrueSet1 <= set1
print(is_subset1)
print(is_subset2)

print("subFalseSet1: ", subFalseSet1, " in set1: ", set1)
is_subset1 = subFalseSet1.issubset(set1)
is_subset2 = subFalseSet1 <= set1
print(is_subset1)
print(is_subset2)
