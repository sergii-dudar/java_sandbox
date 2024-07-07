#!/usr/bin/python3.12

class Employee:
    empCount = 0

    def __init__(self, name, age):
        self.__name = name
        self.__age = age
        Employee.empCount += 1

    def showcount(self):
        print(self.empCount)

    counter = classmethod(showcount)


e1 = Employee("Bhavana", 24)
e2 = Employee("Rajesh", 26)
e3 = Employee("John", 27)

e1.showcount()
Employee.counter()

# ========================================Using @classmethod Decorator
print("\n========================================|||:Using @classmethod Decorator")


class Employee:
    empCount = 0

    def __init__(self, name, age):
        self.name = name
        self.age = age
        Employee.empCount += 1

    @classmethod
    def showcount(cls):
        print(cls.empCount)

    @classmethod
    def newemployee(cls, name, age):
        return cls(name, age)


e1 = Employee("Bhavana", 24)
e2 = Employee("Rajesh", 26)
e3 = Employee("John", 27)
e4 = Employee.newemployee("Anil", 21)
Employee.showcount()

# ========================================Access Class Attributes in Class Method
print("\n========================================|||:Access Class Attributes in Class Method")


class Cloth:
    # Class attribute
    price = 4000

    @classmethod
    def showPrice(cls):
        return cls.price


# Accessing class attribute
print(Cloth.showPrice())

# ========================================Dynamically Add Class Method to a Class
print("\n========================================|||:Dynamically Add Class Method to a Class")


class Cloth:
    pass


# class method
# @classmethod
def brandName(cls):
    print("Name of the brand is Raymond")


# adding dynamically
setattr(Cloth, "brand_name", brandName)
newObj = Cloth()
newObj.brand_name()

# ========================================Dynamically Delete Class Methods
print("\n========================================|||:Dynamically Delete Class Methods")


class Cloth:
    # class method
    @classmethod
    def brandName(cls):
        print("Name of the brand is Raymond")


# deleting dynamically
del Cloth.brandName
print("Method deleted")
