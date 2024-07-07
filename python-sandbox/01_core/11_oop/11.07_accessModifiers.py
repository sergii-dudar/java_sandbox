#!/usr/bin/python3.12

class Employee:
    'Common base class for all employees'

    def __init__(self, name="Bhavana", age=24):
        self.name = name
        self.age = age


e1 = Employee()
e2 = Employee("Bharat", 25)

print("Name: {}, age: {}".format(e1.name, e1.age))
print("Name: {}, age: {}".format(e2.name, e2.age))


# -------- modifiers

class Employee:
    def __init__(self, name, age, salary):
        self.name = name  # public variable
        self.__age = age  # private variable
        self._salary = salary  # protected variable

    def displayEmployee(self):
        print("Name : ", self.name, ", age: ", self.__age, ", salary: ",
              self._salary)


e1 = Employee("Bhavana", 24, 10000)

print(e1.name)
print(e1._salary)
# print(e1.__age) # error

# Name Mangling
print(e1._Employee__age)

# ========================================Property Object
print("\n========================================|||:Property Object")
# Syntax: property(fget=None, fset=None, fdel=None, doc=None)


# ========================================Getters and Setter Methods
print(
    "\n========================================|||:Getters and Setter Methods")


class Employee:
    def __init__(self, name, age):
        self.__name = name
        self.__age = age

    def get_name(self):
        return self.__name

    def get_age(self):
        return self.__age

    def set_name(self, name):
        self.__name = name
        return self

    def set_age(self, age):
        self.__age = age
        return self


e1 = Employee("Bhavana", 24)
print("Name:", e1.get_name(), "age:", e1.get_age())
(e1
 .set_name("Archana")
 .set_age(21))
print("Name:", e1.get_name(), "age:", e1.get_age())

# ========================================
print("\n========================================|||:")


class Employee:
    def __init__(self, name, age):
        self.__name = name
        self.__age = age

    def get_name(self):
        return self.__name

    def get_age(self):
        return self.__age

    def set_name(self, name):
        self.__name = name
        return

    def set_age(self, age):
        self.__age = age
        return

    name = property(get_name, set_name, "name")
    age = property(get_age, set_age, "age")


e1 = Employee("Bhavana", 24)
print("Name:", e1.name, "age:", e1.age)

e1.name = "Archana"
e1.age = 23
print("Name:", e1.name, "age:", e1.age)
