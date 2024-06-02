#!/usr/bin/python3.12

'''
In Python, bool is a sub-type of int type. A bool object has two possible values,
and it is initialized with Python keywords, True and False.
'''

print("bool to int:", int(True))
print("bool to float:", float(False))
print("bool to complex:", complex(True))

# ---------------- Boolean Expression
print("\n|||Boolean Expression:")

# Check true
a = True
print(bool(a))
# Check false
a = False
print(bool(a))
# Check 0
a = 0.0
print(bool(a))
# Check 1
a = 1.0
print(bool(a))
# Check Equality
a = 5
b = 10
print(bool(a == b))
# Check None
a = None
print(bool(a))
# Check an empty sequence
a = ()
print(bool(a))
# Check an empty mapping
a = {}
print(bool(a))
# Check a non empty string
a = 'Tutorialspoint'
print(bool(a))
