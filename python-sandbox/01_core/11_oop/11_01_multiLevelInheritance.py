#!/usr/bin/python3.12

# ========================================Multi-Level inheritance
print("\n========================================|||:Multi-Level inheritance")


class Animal:
    def speak(self):
        print("Animal Speaking")
    # The child class Dog inherits the base class Animal


class Dog(Animal):
    def bark(self):
        print("dog barking")
    # The child class Dogchild inherits another child class Dog


class DogChild(Dog):
    def eat(self):
        print("Eating bread...")


d = DogChild()
d.bark()
d.speak()
d.eat()

# ========================================Multiple inheritance
print("\n========================================|||:Multiple inheritance")


class Calculation1:
    def summation(self, a, b):
        return a + b


class Calculation2:
    def multiplication(self, a, b):
        return a * b


class Derived(Calculation1, Calculation2):
    def divide(self, a, b):
        return a / b


d = Derived()
print(d.summation(10, 20))
print(d.multiplication(10, 20))
print(d.divide(10, 20))

print(issubclass(Derived, Calculation2))
print(issubclass(Calculation1, Calculation2))

# ========================================Method Overriding
print("\n========================================|||:Method Overriding")


class Animal:
    def speak(self):
        print("speaking")


class Dog(Animal):
    def speak(self):
        print("Barking")


d = Dog()
d.speak()

# ========================================
print("\n========================================|||:")


class Bank:
    def getroi(self):
        return 10


class SBI(Bank):
    def getroi(self):
        return 7


class ICICI(Bank):
    def getroi(self):
        return 8


b1 = Bank()
b2 = SBI()
b3 = ICICI()
print("Bank Rate of interest:", b1.getroi())
print("SBI Rate of interest:", b2.getroi())
print("ICICI Rate of interest:", b3.getroi())

# ========================================
print("\n========================================|||:")
