#!/usr/bin/python3.12

# ========================================Create an Abstract Class
print("\n========================================|||:Create an Abstract Class")

from abc import ABC, abstractmethod


class democlass(ABC):
    @abstractmethod
    def method1(self):
        print("abstract method")
        return

    def method2(self):
        print("concrete method")


class concreteclass(democlass):
    def method1(self):
        super().method1()
        return


obj = concreteclass()
obj.method1()
obj.method2()
