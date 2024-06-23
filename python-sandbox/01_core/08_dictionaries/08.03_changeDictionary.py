#!/usr/bin/python3.12

person = {'name': 'Alice', 'age': 25, 'city': 'New York'}
person['age'] = 26
print(person)

# Conditional
if person['age'] == 25:
    person['age'] = 26
print(person)

# ========================================Updating Multiple Dictionary Values
print("\n========================================|||:Updating Multiple Dictionary Values")

person.update({'age': 26, 'city': 'Los Angeles'})
print(person)

# ========================================Adding New Key-Value Pairs
print("\n========================================|||:Adding New Key-Value Pairs")

# new key add
person['city2'] = 'New York'
print(person)

# setdefault()

# Adding a new key-value pair 'city': 'New York'
person.setdefault('city3', 'New York')
print(person)

# ========================================Removing Key-Value Pairs
print("\n========================================|||:Removing Key-Value Pairs")

person = {'name': 'Alice', 'age': 25, 'city': 'New York'}
del person['age']
print(person)

# Using the pop() Method

person = {'name': 'Alice', 'age': 25, 'city': 'New York'}
# Removing the key-value pair associated with the key 'age'
removed_age = person.pop('age')

print(person)
print("Removed age:", removed_age)

# Using the popitem()

person = {'name': 'Alice', 'age': 25, 'city': 'New York'}
# Removing the last key-value pair
print(person)
removed_item = person.popitem()

print(person)
print("Removed item:", removed_item)
