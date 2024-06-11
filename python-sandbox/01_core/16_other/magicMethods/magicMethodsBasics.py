#!/usr/bin/python3.12
# https://www.javatpoint.com/python-magic-method

# ========================================__add__ Method
print("\n========================================|||:__add__ Method")


# Creating a class
class AddMethod:
    def __init__(self, argument):
        self.attribute = argument

    def __add__(self, object1):
        print("__add__ from AddMethod")
        return self.attribute + object1.attribute


class AddMethod_2:
    def __init__(self, argument):
        self.attribute = argument

    def __add__(self, object1):
        print("__add__ from AddMethod_2")
        return self.attribute + object1.attribute


instance_1 = AddMethod(" Attribute")
print(instance_1)
instance_2 = AddMethod_2(" 27")
print(instance_2)
print(instance_2 + instance_1)
print(instance_1 + instance_2)

# ========================================__repr__ Method
print("\n========================================|||:__repr__ Method")


# The class instance is represented as a string using the magic method __repr__.
# The __repr__ method, which produces a string in the output, is automatically called
# whenever we attempt to print an object of that class.

class ReprMethod:
    # Calling __init__ method and initializing the attributes of the class
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z
        # Calling the __repr__ method and providing the string to be printed each time instance is printe

    def __repr__(self):
        return f"Following are the values of the attributes of the class Method:\nx = {self.x}\ny = {self.y}\nz = {self.z}"


print(ReprMethod(4, 6, 2))

# ========================================__contains__ Method
print("\n========================================|||:__contains__ Method")


# Creating a class
class ContainsMethod:
    # Calling the __init__ method and initializing the attributes
    def __init__(self, attribute):
        self.attribute = attribute

        # Calling the __contains__ method

    def __contains__(self, attribute):
        return attribute in self.attribute


instance = ContainsMethod([4, 6, 8, 9, 1, 6])

# Checking if a value is present in the container attribute
print("4 is contained in ""attribute"": ", 4 in instance)
print("5 is contained in ""attribute"": ", 5 in instance)

# ========================================__call__ Method
print("\n========================================|||:__call__ Method")


# Creating a class
class CallMethod:
    # Calling the __init__ method and initializing the attributes
    def __init__(self, a):
        self.a = a
        # Calling the __call__ method to multiply a number to the attribute value

    def __call__(self, number):
        return self.a * number


instance = CallMethod(7)
print(instance.a)  # Printing the value of the attribute a
# Calling the instance while passing a value which will call the __call__ method
print(instance(5))

# ========================================__iter__ Method
print("\n========================================|||:__iter__ Method")


# For the given instance, a generator object is supplied using the __iter__ method.
# To benefit from the __iter__ method, we can leverage the iter() and next() methods.

class IterMethod:
    def __init__(self, start_value, stop_value):
        self.start = start_value
        self.stop = stop_value

    def __iter__(self):
        for num in range(self.start, self.stop + 1):
            yield num ** 2


instance = iter(IterMethod(3, 8))
print(next(instance))
print(next(instance))
print(next(instance))
print(next(instance))
print(next(instance))
print(next(instance))

# ========================================__new__() Method
print("\n========================================|||:__new__() Method")


# The magic method __new__() is called implicitly by the __init__() method.
# The new instance returned by the __new__() method is initialised.

class NewMethod(object):
    def __new__(cls):
        print("Creating an instance by __new__ method")
        return super(NewMethod, cls).__new__(cls)
        # Calling the init method

    def __init__(self):
        print("Init method is called here")


NewMethod()

# ========================================__init__ Method
print("\n========================================|||:__init__ Method")


class InitMethod:
    def __init__(self, *args):
        print("Now called __init__ magic method, after tha initialised parameters")
        self.name = args[0]
        self.std = args[1]
        self.marks = args[2]


test = InitMethod("Itika", 11, 98)
print(test)
print(f"Name, standard, and marks of the student is: \n", test.name, "\n", test.std, "\n", test.marks)
