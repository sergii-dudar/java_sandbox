#!/usr/bin/python3.12
# https://www.javatpoint.com/python-decorator

# ========================================@property decorator
print("\n========================================|||:@property decorator")


class Student:  # here, we are creating a class with the name Student
    def __init__(self, name, grade):
        self.name = name
        self.grade = grade

    @property
    def display(self):
        return self.name + " got grade " + self.grade


stu = Student("John", "B")
print("Name of the student: ", stu.name)
print("Grade of the student: ", stu.grade)
print(stu.display)  # @property allows to call function as prop access

# ========================================@staticmethod decorator
print("\n========================================|||:@staticmethod decorator")


# The @staticmethod is used to define a static method in the class. It is called by using
# the class name as well as instance of the class. Consider the following code:

class Person:  # here, we are creating a class with the name Student
    @staticmethod
    def hello():  # here, we are defining a function hello
        print("Hello Peter")


per = Person()
per.hello()
Person.hello()  # allowed by @staticmethod

# ========================================Nesting Decorators
print("\n========================================|||:Nesting Decorators")


# We can use multiple decorators by using them on top of each other. Let's consider the following example:

def function1(func):
    def decorator(*args, **kwargs):
        print("---->call from function1()")
        return func(*args, **kwargs)

    return decorator


def function2(func):
    def decorator(*args, **kwargs):
        print("---->call from function2()")
        return func(*args, **kwargs)

    return decorator


@function1
@function2
@function2
def function(name):
    print(f"{name}")


function("Serhii")

# ========================================Decorator with Arguments
print("\n========================================|||:Decorator with Arguments")

# It is always useful to pass arguments in a decorator. The decorator can be executed several
# times according to the given value of the argument. Let us consider the following example:

import functools  # here, we are importing the functools into our program


def repeat(num):  # here, we are defining a function repeat and passing parameter
    # Here, we are creating and returning a wrapper function
    def decorator_repeat(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            for _ in range(num):  # here, we are initializing a for loop and iterating till num
                value = func(*args, **kwargs)
            return value  # here, we are returning the value

        return wrapper  # here, we are returning the wrapper class

    return decorator_repeat


# Here we are passing num as an argument which repeats the print function
@repeat(num=5)
def function1(name):
    print(f"{name}")


function1("Test")

# ========================================Stateful Decorators
print("\n========================================|||:Stateful Decorators")


def count_function(func):
    # here, we are defining a function and passing the parameter func
    # @functools.wraps(func)
    def wrapper_count_calls(*args, **kwargs):
        wrapper_count_calls.num_calls += 1

        print(f"Call{wrapper_count_calls.num_calls} of {func.__name__!r}")
        return func(*args, **kwargs)

    wrapper_count_calls.num_calls = 0
    return wrapper_count_calls  # here, we are returning the wrapper call counts


@count_function
def say_hello():  # here, we are defining a function and passing the parameter
    print("Say Hello")


say_hello()
say_hello()

# ========================================Classes as Decorators
print("\n========================================|||:Classes as Decorators")


class Count_Calls:  # here, we are creating a class for getting the call count
    def __init__(self, func):
        #functools.update_wrapper(self, func)
        self.func = func
        self.num_calls = 0

    def __call__(self, *args, **kwargs):
        self.num_calls += 1
        print(f"Call{self.num_calls} of {self.func.__name__!r}")
        return self.func(*args, **kwargs)


@Count_Calls
def say_hello():  # here, we are defining a function and passing the parameter
    print("Say Hello")


say_hello()
say_hello()
say_hello()
