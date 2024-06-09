#!/usr/bin/python3.12

# In Python, a frozen set is an immutable version of the built-in set data type. It is similar to a set, but its contents cannot be changed once a frozen set is created.

# One of the main advantages of using frozen set objects is that they are hashable, meaning they can be used as keys in dictionaries or as elements of other sets

dictionary = {"Name": "John", "Country": "USA", "ID": 101}
print(type(dictionary))
fFrozenset = frozenset(dictionary)  # Frozenset will contain the keys of the dictionary
print(type(fFrozenset))
for i in fFrozenset:
    print(i)
