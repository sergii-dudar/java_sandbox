#!/usr/bin/python3.12

# Local Variables
# Global Variables
# Nonlocal Variables

# ========================================Local Variables
print("\n========================================|||:Local Variables")


def myfunction():
    a = 10
    b = 20
    print("variable a:", a)
    print("variable b:", b)
    return a + b


print(myfunction())

# ========================================Global Variables
print("\n========================================|||:Global Variables")

# global variables
name = 'TutorialsPoint'
marks = 50


def myfunction1():
    # accessing inside the function
    print("name:", name)
    print("marks:", marks)


# function call
myfunction1()

# ========================================Nonlocal Variables
print("\n========================================|||:Nonlocal Variables")


def yourFunction():
    a = 5
    b = 6

    # nested function
    def myfunction3():
        # nonlocal function
        # nonlocal a
        # nonlocal b
        a = 10
        b = 20
        print("variable a: {}, b: {}".format(a, b))
        return a + b

    print(myfunction3())
    print("variable a: {}, b: {}".format(a, b))


yourFunction()

# ========================================Python globals() Function
print("\n========================================|||:Python globals() Function")

print(globals())

# ========================================Python locals() Function
print("\n========================================|||:Python locals() Function")

name = 'TutorialsPoint'
marks = 50
result = True


def myfunction():
    a = 10
    b = 20
    c = a + b
    print("globals():", globals())
    print("locals():", locals())
    return c


myfunction()
print()
print(globals()['name'])  # displays TutorialsPoint
print(locals().get('a'))  # displays 10

# ========================================Namespace Conflict in Python
print("\n========================================|||:Namespace Conflict in Python")

marks = 50  # this is a global variable


def myfunction():
    marks = 70  # this is a local variable
    print(marks)


myfunction()
print(marks)  # prints global value

print()

# -------------
# def myfunction():
#    marks = marks + 20 # If you try to manipulate value of a global variable from inside a function, Python raises UnboundLocalError.
#    print(marks)


# ========================================Modifying global variable from function
print("\n========================================|||:Modifying global variable from function")

var1 = 50  # this is a global variable
var2 = 60  # this is a global variable


def myfunction():
    """Change values of global variables"""
    globals()['var1'] = globals()['var1'] + 10
    global var2
    var2 = var2 + 20


myfunction()
print("var1:", var1, "var2:", var2)  # shows global variables with changed values
