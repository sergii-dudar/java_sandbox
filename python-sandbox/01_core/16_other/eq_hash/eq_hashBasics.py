#!/usr/bin/python3.12

# we can use custom objects as keys in a set or dictionary in Python, but there are
# certain requirements that these objects need to meet:
# - Hashability: The object must have a __hash__ method that returns an integer.
# - Equality: The object must have an __eq__ method that allows comparison with other objects.


# __hash__ Method: This method returns the hash value of the object. In this example,
#       we use a tuple of name and age to generate a hash.
# __eq__ Method: This method checks if two objects are equal. Two Person instances are
#       considered equal if their name and age attributes are the same.
# Using Custom Object as Key: Instances of Person can be used as keys in the dictionary because
#       they are hashable and comparable for equality.
# Handling Collisions:  If person1 and person3 have the same name and age, they are treated as
#       the same key in the dictionary. Therefore, adding person3 updates the value for person1.


# ========================================
print("\n========================================|||:")


class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __hash__(self):
        # Combine the hash values of name and age
        return hash((self.name, self.age))

    def __eq__(self, other):
        # Two persons are considered equal if they have the same name and age
        if isinstance(other, Person):
            return self.name == other.name and self.age == other.age
        return False

    def __repr__(self):
        return f'Person(name={self.name}, age={self.age})'

    def __str__(self):
        return self.__str__()


# Creating instances of Person
person1 = Person('Alice', 30)
person2 = Person('Bob', 25)
person3 = Person('Alice', 30)

# ========================================Dictionary
print("\n========================================|||:Dictionary")

# Using Person instances as dictionary keys
people_dict = {person1: 'Engineer', person2: 'Doctor'}

# Accessing values using Person instances
print(people_dict[person1])  # Output: Engineer
print(people_dict[person2])  # Output: Doctor

# Adding another Person instance with the same attributes as person1
people_dict[person3] = 'Architect'

# person3 should be considered the same as person1
print(people_dict[person1])  # Output: Architect

# Printing the dictionary
print(people_dict)

# ========================================Set
print("\n========================================|||:Set")

# Creating a set of Person instances
people_set = {person1, person2}

# Adding a new Person instance with the same attributes as person1
people_set.add(person3)

# Printing the set
print(people_set)  # Output: {Person(name=Alice, age=30), Person(name=Bob, age=25)}
