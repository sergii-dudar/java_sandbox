#!/usr/bin/python3.12

# ========================================Static Methods
print("\n========================================|||:Static Methods")


class Employee:
    empCount = 0

    def __init__(self, name, age):
        self.__name = name
        self.__age = age
        Employee.empCount += 1

    # creating staticmethod
    def showcount():
        print(Employee.empCount)
        return

    counter = staticmethod(showcount)


e1 = Employee("Bhavana", 24)
e2 = Employee("Rajesh", 26)
e3 = Employee("John", 27)

e1.counter()
Employee.counter()

# ========================================Using @staticmethod Decorator
print("\n========================================|||:Using @staticmethod Decorator")


class Student:
    stdCount = 0

    def __init__(self, name, age):
        self.__name = name
        self.__age = age
        Student.stdCount += 1

    # creating staticmethod
    @staticmethod
    def showcount():
        print(Student.stdCount)


e1 = Student("Bhavana", 24)
e2 = Student("Rajesh", 26)
e3 = Student("John", 27)

print("Number of Students:")
Student.showcount()
