#!/usr/bin/python3.12

# ========================================
print("\n========================================|||:")


# a default function to take another function parameter
def spell(text):
    # Making text in upper
    return text.upper()


# Taking text as user input
text = "Test Text"  # input("Enter a text to print it in uppercase and double: ")
# Spell function with text
print(spell(text))
# Assigning variable with the default function
scream = spell
# Scream with text variable
print(scream(text))

# ========================================Functions as a parameter for another function
print("\n========================================|||:Functions as a parameter for another function")


# Default function for making text uppercase
def scream(word):
    return word.upper()


# Default function for making text lowercase
def spell(word):
    return word.lower()


# A third function that work as a high order function
def speak(funct):
    # Storing the function in a variable in high order function
    speaking = funct("Hello Python Developers! You are welcomed to JavaTpoint")
    print(speaking)


# Printing text in uppercase
speak(scream)
# Printing text in lowercase
speak(spell)

# ========================================Returning function as a result in high order function
print("\n========================================|||:Returning function as a result in high order function")


# A default function for addition
def adding(a):
    # Nested function with second number
    def addition(b):
        return a + b  # addition of two numbers

    return addition  # Result


print("Sum of Two numbers given by you is: ", adding(4)(7))

# ========================================Decorators as high order function
print("\n========================================|||:Decorators as high order function")


# Using default function as Python decorators
def python_decorator(funct):
    # Inner nested function
    def inner():
        print("-->This line of code will be printed before the execution of high order function")
        funct()
        print("-->This line of code will be printed after the execution of high order function")

    return inner


# A default function as decorator
def jtp_decorator():
    print("---->This line of code will be printed inside the execution of high order function")


jtp_decorator = python_decorator(jtp_decorator)  # Python decorator as high order function
# Python decorator calling out as high order function
jtp_decorator()
