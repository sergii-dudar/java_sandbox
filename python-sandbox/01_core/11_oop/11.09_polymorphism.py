#!/usr/bin/python3.12

# What is Polymorphism in Python?
# The term polymorphism refers to a function or method taking different forms in
# different contexts. Since Python is a dynamically typed language, polymorphism
# in Python is very easily implemented.

# If a method in a parent class is overridden with different business logic in
# its different child classes, the base class method is a polymorphic method.

# Ways of implementing Polymorphism in Python
# - Duck Typing
# - Operator Overloading
# - Method Overriding
# - Method Overloading

# ========================================Duck Typing in Python
print("\n========================================|||:Duck Typing in Python")


class Duck:
    def sound(self):
        return "Quack, quack!"


class AnotherBird:
    def sound(self):
        return "I'm similar to a duck!"


def makeSound(duck):
    print(duck.sound())


# creating instances
duck = Duck()
anotherBird = AnotherBird()
# calling methods
makeSound(duck)
makeSound(anotherBird)

# ========================================Method Overriding in Python
print(
    "\n========================================|||:Method Overriding in Python")

from abc import ABC, abstractmethod


class shape(ABC):
    @abstractmethod
    def draw(self):
        """Abstract method"""
        return


class circle(shape):
    def draw(self):
        super().draw()
        print("Draw a circle")
        return


class rectangle(shape):
    def draw(self):
        super().draw()
        print("Draw a rectangle")
        return


shapes = [circle(), rectangle()]
for shp in shapes:
    shp.draw()

# ========================================Overloading Operators in Python
print(
    "\n========================================|||:Overloading Operators in Python")


class Vector:
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def __str__(self):
        return 'Vector (%d, %d)' % (self.a, self.b)

    def __add__(self, other):
        return Vector(self.a + other.a, self.b + other.b)


v1 = Vector(2, 10)
v2 = Vector(5, -2)
print(v1 + v2)

# ========================================Method Overloading in Python
print(
    "\n========================================|||:Method Overloading in Python")


def add(*nums):
    return sum(nums)


# Call the function with different number of parameters
result1 = add(10, 25)
result2 = add(10, 25, 35)

print(result1)
print(result2)
