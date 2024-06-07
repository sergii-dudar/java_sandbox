#!/usr/bin/python3.12


class Employee:  # create Employee class name
    dept = 'Information technology'  # define class variable (static)

    def __init__(self, name, id):
        self.name = name  # instance variable
        self.id = id  # instance variable


# Define the objects of Employee class
emp1 = Employee('John', 'E101')
emp2 = Employee('Marcus', 'E105')

print(emp1.dept)
print(emp2.dept)
print(emp1.name)
print(emp2.name)
print(emp1.id)
print(emp2.id)

# Access class variable using the class name
print(Employee.dept)  # print the department

# change the department of particular instance
emp1.dept = 'Networking'
print(emp1.dept)
print(emp2.dept)

# change the department for all instances of the class
Employee.dept = 'Database Administration'
print(emp1.dept)
print(emp2.dept)

# ========================================
print("\n========================================|||:")


class Car:
    # define the class variable or static variable of class Car
    num = 7
    msg = 'This is a good Car.'


# create the object of the class
obj = Car()

# Access a static variable num using the class name with a dot operator.
print("Lucky No.", Car.num)
print(Car.msg)

# ========================================Static Method
print("\n========================================|||:Static Method")

# There are the two ways to define a static method in Python:
# - Using the staticmethod() Method
# - Using the @staticmethod Decorator

print("\n========================================|||:staticmethod()")


class Marks:
    def Math_num(a, b):  # define the static Math_num() function
        return a + b

    def Sci_num(a, b):  # define the static Sci_num() function
        return a + b

    def Eng_num(a, b):  # define the static Eng_num() function
        return a + b
    # create Math_num as static method


Marks.Math_num = staticmethod(Marks.Math_num)

# print the total marks in Maths
print(" Total Marks in Maths", Marks.Math_num(64, 28))

# create Sci_num as static method
Marks.Sci_num = staticmethod(Marks.Sci_num)

# print the total marks in Science
print(" Total Marks in Science", Marks.Sci_num(70, 25))

# create Eng_num as static method
Marks.Eng_num = staticmethod(Marks.Eng_num)

# print the total marks in English
print(" Total Marks in English", Marks.Eng_num(65, 30))

# In the above program, we declared the Math_num method, Sci_num method, and Eng_num method
# as static method outside the class using staticmethod() function. After that, we can call
# the static method directly using the class name Marks.

print("\n========================================|||:@staticmethod Decorator")


class Marks2:
    @staticmethod
    def Math_num(a, b):  # define the static Math_num() function
        return a + b

    @staticmethod
    def Sci_num(a, b):  # define the static Sci_num() function
        return a + b

    @staticmethod
    def Eng_num(a, b):  # define the static Eng_num() function
        return a + b

    # print the total marks in Maths


print(" Total Marks in Maths", Marks2.Math_num(64, 28))

# print the total marks in Science
print(" Total Marks in Science", Marks2.Sci_num(70, 25))

# print the total marks in English
print(" Total Marks in English", Marks2.Eng_num(65, 30))

print("\n========================================|||:")


class Test:
    # define a static method using the @staticmethod decorator in Python.
    @staticmethod
    def beg():
        print("Welcome to the World!! ")

    # create an  object of the class Test


obj = Test()
# call the static method
obj.beg()
Test.beg()

print("\n========================================|||:")


class Person:
    @staticmethod
    def Age(age):
        if (age <= 18):  # check whether the Person is eligible to vote or not.
            print("The person is not eligible to vote.")
        else:
            print("The person is eligible to vote.")


Person.Age(17)
