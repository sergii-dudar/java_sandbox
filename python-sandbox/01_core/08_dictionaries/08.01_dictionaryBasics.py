#!/usr/bin/python3.12

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
