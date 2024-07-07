#!/usr/bin/python3.12

from abc import ABC, abstractmethod

# Rules for implementing Python Interfaces
# - Methods defined inside an interface must be abstract.
# - Creating object of an interface is not allowed.
# - A class implementing an interface needs to define all the methods
#   of that interface.
# - In case, a class is not implementing all the methods defined inside
#   the interface, the class must be declared abstract.

# Ways to implement Interfaces in Python
# - Formal Interface
# - Informal Interface

# ========================================Formal Interface
print("\n========================================|||:Formal Interface")


# creating interface
class demoInterface(ABC):
    @abstractmethod
    def method1(self):
        print("Abstract method1")
        return

    @abstractmethod
    def method2(self):
        print("Abstract method1")
        return


class concreteclass(demoInterface):
    def method1(self):
        print("This is method1")
        return

    def method2(self):
        print("This is method2")
        return


# creating instance
obj = concreteclass()

# method call
obj.method1()
obj.method2()

# ========================================Informal Interface
print("\n========================================|||:Informal Interface")


class demoInterface:
    def displayMsg(self):
        pass


class newClass(demoInterface):
    def displayMsg(self):
        print("This is my message")


# creating instance
obj = newClass()

# method call
obj.displayMsg()
