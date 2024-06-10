#!/usr/bin/python3.12

# Syntax:
#
# try:
#     # Code block
#     # These statements are those which can probably have some error
#
# except:
#     # This block is optional.
#     # If the try block encounters an exception, this block will handle it.
#
# else:
#     # If there is no exception, this code block will be executed by the Python interpreter
#
# finally:
#     # Python interpreter will always execute this code.


# ========================================
print("\n========================================|||:")

a = ["Python", "Exceptions", "try and except"]
try:
    # looping through the elements of the array a, choosing a range that goes beyond the length of the array
    for i in range(4):
        print("The index and element from the array is", i, a[i])
    # if an error occurs in the try block, then except block will be executed by the Python interpreter
except:
    print("Index out of range")

# ========================================assert Statement
print("\n========================================|||:assert Statement")


# Python program to show how to use assert keyword
# defining a function
def square_root(Number):
    assert (Number < 0), "Give a positive integer"
    return Number ** (1 / 2)


# Calling function and passing the values
# print(square_root(36))
# print(square_root(-36))



# ========================================Else Clause
print("\n========================================|||:Else Clause")


def reciprocal(num1):
    try:
        reci = 1 / num1
    except ZeroDivisionError:
        print("We cannot divide by zero")
    else:
        # only in case no errors
        print(reci)


reciprocal(4)
reciprocal(0)

# ========================================Finally Keyword
print("\n========================================|||:Finally Keyword")

try:
    div = 4 // 0
    print(div)
# this block will handle the exception raised
except ZeroDivisionError:
    print("Atepting to divide by zero")
# this will always be executed no matter exception is raised or not
finally:
    print('This is code of finally clause')

# ========================================User-Defined Exceptions
print("\n========================================|||:User-Defined Exceptions")


class EmptyError(RuntimeError):
    def __init__(self, argument):
        self.arguments = argument


var = " "
try:
    raise EmptyError("The variable is empty")
except EmptyError as ex:
    print("Error during processing:", ex)
