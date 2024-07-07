#!/usr/bin/python3.12

class Employee:
    """Common base class for all employees"""
    empCount = 0

    def __init__(self, name, salary):
        self.name = name
        self.salary = salary
        Employee.empCount += 1

    def displayCount(self):
        print("Total Employee %d" % Employee.empCount)

    def displayEmployee(self):
        print("Name : ", self.name, ", Salary: ", self.salary)


# This would create first object of Employee class
emp1 = Employee("Zara", 2000)
# This would create second object of Employee class
emp2 = Employee("Manni", 5000)
emp1.displayEmployee()
emp2.displayEmployee()
print("Total Employee %d" % Employee.empCount)

# emp1.age = 7 # Add an 'age' attribute
# emp1.age = 8 # Modify 'age' attribute
# del emp1.age # Delete 'age' attribute

# hasattr(emp1, 'age')  # Returns true if 'age' attribute exists
# getattr(emp1, 'age')  # Returns value of 'age' attribute
# setattr(emp1, 'age', 8)  # Set attribute 'age' at 8
# delattr(empl, 'age')  # Delete attribute 'age'

# ========================================Built-In Class Attributes in Python
print("\n========================================|||:Built-In Class Attributes in Python")

print("Employee.__doc__:", Employee.__doc__)
print("Employee.__name__:", Employee.__name__)
print("Employee.__module__:", Employee.__module__)
print("Employee.__bases__:", Employee.__bases__)
print("Employee.__dict__:", Employee.__dict__)

# ========================================Built-in Class of Python datatypes
print("\n========================================|||:Built-in Class of Python datatypes")

num = 20
print(type(num))
num1 = 55.50
print(type(num1))
s = "TutorialsPoint"
print(type(s))
dct = {'a': 1, 'b': 2, 'c': 3}
print(type(dct))


def SayHello():
    print("Hello World")
    return


print(type(SayHello))

# ========================================Garbage Collection(Destroying Objects) in Python
print("\n========================================|||:Garbage Collection(Destroying Objects) in Python")


class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def __del__(self):
        class_name = self.__class__.__name__
        print(class_name, "destroyed")


pt1 = Point()
pt2 = pt1
pt3 = pt1
# prints the ids of the obejcts
print(id(pt1), id(pt2), id(pt3))
del pt1
del pt2
del pt3

# ========================================Data Hiding in Python
print("\n========================================|||:Data Hiding in Python")


class JustCounter:
    __secretCount = 0

    def count(self):
        self.__secretCount += 1
        print(self.__secretCount)


counter = JustCounter()
counter.count()
counter.count()
# print(counter.__secretCount)
print(counter._JustCounter__secretCount)

# ========================================
print("\n========================================|||:")
