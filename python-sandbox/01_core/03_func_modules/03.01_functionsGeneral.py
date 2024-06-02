#!/usr/bin/python3.12

def greetings():
    """
    This is docstring of greetings function
    """
    print("Hello World")
    return


greetings()


def printme(str):
    "This prints a passed string into this function"
    print(str)
    return;


# Now you can call printme function
printme("I'm first call to user defined function!")
printme("Again second call to the same function")

# ----------------pass params
print("\n|||:pass params")


def testfunction(arg):
    print("ID inside the function:", id(arg))


var = "Hello"
print("ID before passing:", id(var))
testfunction(var)

print("--")


def testfunction(arg):
    print("ID inside the function:", id(arg))
    arg = arg + 1
    print("new object after increment", arg, id(arg))


var = 10
print("ID before passing:", id(var))
testfunction(var)
print("value after function call", var)

print("--")


def testfunction(arg):
    print("Inside function:", arg)
    print("ID inside the function:", id(arg))
    arg = arg.append(100)


var = [10, 20, 30, 40]
print("ID before passing:", id(var))
testfunction(var)
print("list after function call", var)
print("ID after passing:", id(var))

# ----------------Python Function Arguments
print("\n|||:Python Function Arguments")


def greetings2(name):
    "This is docstring of greetings function"
    print("Hello {}".format(name))
    return


greetings2("Samay")
greetings2("Pratima")
greetings2("Steven")

# ----------------Keyword Arguments
print("\n|||:Keyword Arguments")


# Function definition is here
def printme1(str):
    """
     This prints a passed string into this function"
    """
    print(str)
    return


# Now you can call printme function
printme1(str="My string")


def printinfo1(name, age):
    "This prints a passed info into this function"
    print("Name: ", name)
    print("Age ", age)
    return;


# Now you can call printinfo function
printinfo1(age=50, name="miki")

# ----------------Default Arguments
print("\n|||:Default Arguments")


def printinfo2(name, age=35):
    "This prints a passed info into this function"
    print("Name: ", name)
    print("Age ", age)
    return;


# Now you can call printinfo function
printinfo2(age=50, name="miki")
printinfo2(name="miki")

# ----------------Positional-only arguments
print("\n|||:Positional-only arguments ")


# The benefit of using this type of argument is that it ensures the functions are called
# with the correct arguments in the correct order. The positional-only arguments should be passed to a function as positional arguments, not keyword arguments.

def posFun(x, y, /, z):
    print(x + y + z)


print("Evaluating positional-only arguments: ")
posFun(33, 22, z=11)

# ----------------Keyword-only arguments
print("\n|||:Keyword-only arguments")


# Keyword-only arguments are those arguments that must be specified by their name while
# calling the function. They are defined by placing an asterisk ("*") in the function's parameter list before any keyword-only parameters. This type of argument can only be passed to a function as a keyword argument, not a positional argument.

def posFun(*, num1, num2, num3):
    print(num1 * num2 * num3)


print("Evaluating keyword-only arguments: ")
posFun(num1=6, num2=8, num3=5)

# ----------------Arbitrary or Variable-length Arguments
print("\n|||:Arbitrary or Variable-length Arguments")


# Function definition is here
def printinfo(arg1, *vartuple):
    """
    This prints a variable passed arguments
    """

    print("Output is: ")
    print(arg1)
    for item in vartuple:
        print(item)
    return


# Now you can call printinfo function
printinfo(10)
printinfo(70, 60, 50)

# ----------------Return Value
print("\n|||:Return Value")


def add(x, y):
    z = x + y
    return z


a = 10
b = 20
result = add(a, b)
print("a = {} b = {} a+b = {}".format(a, b, result))

# ---------------- Anonymous Functions
print("\n|||:Anonymous Functions")

sum1 = lambda arg1, arg2: arg1 + arg2

# Now you can call sum as a function
print("Value of total : ", sum1(10, 20))
print("Value of total : ", sum1(20, 20))

# ----------------Global vs. Local variables
print("\n|||:Global vs. Local variables")

total2 = 0  # This is global variable.


# Function definition is here
def sum2(arg1, arg2):
    # Add both the parameters and return them."
    total2 = arg1 + arg2  # Here total is local variable.
    print("Inside the function local total : ", total2)
    return total2


# Now you can call sum function
sum2(10, 20)
print("Outside the function global total : ", total2)
