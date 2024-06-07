#!/usr/bin/python3.12

# ========================================Join Python Tuples
print("\n========================================|||:Join Python Tuples")

T1 = (10, 20, 30, 40)
T2 = ('one', 'two', 'three', 'four')
T3 = T1 + T2
print("Joined Tuple:", T3)

# ========================================Join Python Tuples using Augmented Concatenation Operator
print("\n========================================|||:Join Python Tuples using Augmented Concatenation Operator")

T1 = (10, 20, 30, 40)
T2 = ('one', 'two', 'three', 'four')
T1 += T2
print("Joined Tuple:", T1)

# ========================================Join Python Tuples by Extending Tuple
print("\n========================================|||:Join Python Tuples by Extending Tuple")

T1 = (10, 20, 30, 40)
T2 = ('one', 'two', 'three', 'four')
L1 = list(T1)
L2 = list(T2)
L1.extend(L2)
T1 = tuple(L1)
print("Joined Tuple:", T1)

# ========================================Join Python Tuples using sum() Method
print("\n========================================|||:Join Python Tuples using sum() Method")
# Python's built-in sum() function also helps in concatenating tuples. We use an expression

T1 = (10, 20, 30, 40)
T2 = ('one', 'two', 'three', 'four')
T3 = sum((T1, T2), ())
print("Joined Tuple:", T3)

# ========================================Join Python Tuples using List Comprehension
print("\n========================================|||:Join Python Tuples using List Comprehension")

T1 = (10, 20, 30, 40)
T2 = ('one', 'two', 'three', 'four')

# for x in [T1, T2]:
#    print(x)

L3 = [y for x in [T1, T2] for y in x]
T3 = tuple(L3)
print("Joined Tuple:", T3)

# ========================================Join Python Tuples using for Loop
print("\n========================================|||:Join Python Tuples using for Loop")

T1 = (10, 20, 30, 40)
T2 = ('one', 'two', 'three', 'four')
for t in T2:
    T1 += (t,)
print(T1)
