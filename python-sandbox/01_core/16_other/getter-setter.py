#!/usr/bin/python3.12
# https://www.javatpoint.com/getter-and-setter-in-python

# ========================================
print("\n========================================|||: 1 ")


class Javatpoint:
    def __init__(self, age=0):
        self._age = age
        # using the getter method

    def get_age(self):
        return self._age
        # using the setter method

    def set_age(self, a):
        self._age = a


John = Javatpoint()

# using the setter function
John.set_age(19)

# using the getter function
print(John.get_age())

print(John._age)

# ========================================
print("\n========================================|||: 2 ")


class Javatpoint:
    def __init__(self):
        self._age = 0
        # using the get function

    def get_age(self):
        print("getter method")
        return self._age
        # using the set function

    def set_age(self, y):
        print("setter method")
        self._age = y
        # using the del function

    def del_age(self):
        del self._age

    age = property(get_age, set_age, del_age)


John = Javatpoint()

John.age = 18

print(John.age)

# ======================================== @property decorators to achieve getters and setter behavior
print("\n========================================|||: 3 ")


class Javatpoint2:
    def __init__(self):
        self._age = 0

        # using the getter function

    @property
    def age(self):
        print("getter method")
        return self._age

        # now, using the setter function

    @age.setter
    def age(self, x):
        if (x < 20):
            raise ValueError("the age is below eligibility criteria")
        print("setter method")
        self._age = x


John = Javatpoint2()

John.age = 25

print(John.age)

# ========================================
print("\n========================================|||: 4 ")

# ========================================
print("\n========================================|||: 5 ")

# ========================================
print("\n========================================|||: 6 ")
