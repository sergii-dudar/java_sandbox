#!/usr/bin/python3.12

# dict methods: https://www.tutorialspoint.com/python/python_dictionary_methods.htm


capitals = {"Maharashtra": "Mumbai", "Gujarat": "Gandhinagar",
            "Telangana": "Hyderabad", "Karnataka": "Bengaluru"}
numbers = {10: "Ten", 20: "Twenty", 30: "Thirty", 40: "Forty"}
marks = {"Savita": 67, "Imtiaz": 88, "Laxman": 91, "David": 49}

d1 = {"Fruit": ["Mango", "Banana"], "Flower": ["Rose", "Lotus"]}
d2 = {('India, USA'): 'Countries', ('New Delhi', 'New York'): 'Capitals'}
print(d1)
print(d2)

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'}
print("dict['Name']: ", dict['Name'])
print("dict['Age']: ", dict['Age'])

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'}
# print ("dict['Alice']: ", dict['Alice']) # KeyError: 'Alice'

# update

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'}
dict['Age'] = 8;  # update existing entry
dict['School'] = "DPS School";  # Add new entry

print("dict['Age']: ", dict['Age'])
print("dict['School']: ", dict['School'])

# delete

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'}
print("Contents of the dictionary: \n", dict)

del dict['Name'];  # remove entry with key 'Name'
print("Contents after removing the key 'Name': \n", dict)

dict.clear();  # remove all entries in dict
print("Contents after removing all entries: \n", dict)

# ops
d1 = {'a': 2, 'b': 4, 'c': 30}
d2 = {'a1': 20, 'b1': 40, 'c1': 60}

# Union of two dictionary objects, retuning new object
d3 = d1 | d2
print(d3)  # {'a': 2, 'b': 4, 'c': 30, 'a1': 20, 'b1': 40, 'c1': 60}

# Augmented dictionary union operator
d1 |= d2
print(d1)  # {'a': 2, 'b': 4, 'c': 30, 'a1': 20, 'b1': 40, 'c1': 60}

# ========================================create a new dictionary by extracting the keys from a given dictionary.
print(
    "\n========================================|||:create a new dictionary by extracting the keys from a given dictionary.")

d1 = {"one": 11, "two": 22, "three": 33, "four": 44, "five": 55}
keys = ['two', 'five']
d2 = {}
for k in keys:
    d2[k] = d1[k]
print(d2)

# ========================================convert a dictionary to list of (k,v) tuples.
print("\n========================================|||:convert a dictionary to list of (k,v) tuples.")

d1 = {"one": 11, "two": 22, "three": 33, "four": 44, "five": 55}
l1 = list(d1.items())
print(l1)

# ========================================remove keys with same values in a dictionary.
print("\n========================================|||:remove keys with same values in a dictionary.")

d1 = {"one": "eleven", "2": 2, "three": 3, "11": "eleven", "four": 44, "two": 2}
vals = list(d1.values())  # all values
uvals = [v for v in vals if vals.count(v) == 1]  # unique values
d2 = {}
for k, v in d1.items():
    if v in uvals:
        d = {k: v}
        d2.update(d)
print("dict with unique value:", d2)
