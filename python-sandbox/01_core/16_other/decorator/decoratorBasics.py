#!/usr/bin/python3.12

# ========================================Decorating functions with parameters
print("\n========================================|||:Decorating functions with parameters")


def divide(x, y):  # here, we are creating a function and passing the parameter
    print(x / y)  # Here, we are printing the result of the expression


def outer_div(func):  # here, we are creating a function and passing the parameter
    def inner(x, y):  # here, we are creating a function and passing the parameter
        if (x < y):
            x, y = y, x
        return func(x, y)
        # here, we are returning a function with some passed parameters

    return inner


divide1 = outer_div(divide)
divide1(2, 4)

# ========================================Syntactic Decorator
print("\n========================================|||:Syntactic Decorator")


# In the above program, we have decorated out_div() that is little bit bulky.
# Instead of using above method, Python allows to use decorator in easy way with @symbol.
# Sometimes it is called "pie" syntax.

def outer_div(func):  # here, we are creating a function and passing the parameter
    def inner(x, y):  # here, we are creating a function and passing the parameter
        if (x < y):
            x, y = y, x
        print(f"---->call from outer_div args {x}, {y}")
        return func(x, y)  # here, we are returning the function with the parameters

    return inner


# Here, the below is the syntax of generator
@outer_div
def divide(x, y):  # here, we are creating a function and passing the parameter
    print(x / y)


divide(4, 5)

# ========================================Reusing Decorator
print("\n========================================|||:Reusing Decorator")


def do_twice(func):  # here, we are creating a function and passing the parameter
    def wrapper_do_twice():
        # here, we are creating a function and passing the parameter
        func()
        func()

    return wrapper_do_twice


# We can import mod_decorator.py in another file. from decorator import do_twice

@do_twice
def say_hello():
    print("Hello There")


say_hello()

# ========================================Python Decorator with Argument
print("\n========================================|||:Python Decorator with Argument")


def do_twice_args(func):
    def wrapper_function(*args, **kwargs):
        func(*args, **kwargs)
        func(*args, **kwargs)

    return wrapper_function


@do_twice_args
def display_args(name):
    print(f"Hello {name}")


display_args("John")

# ========================================Returning Values from Decorated Functions
print("\n========================================|||:Returning Values from Decorated Functions")


@do_twice_args
def return_greeting(name):
    print("We are created greeting")
    return f"Hi {name}"


hi_adam = return_greeting("Adam")

