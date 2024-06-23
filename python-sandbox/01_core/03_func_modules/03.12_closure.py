#!/usr/bin/python3.12

def word():
    string = 'Python functions tutorial'
    x = 5

    def number():
        print(string)
        print(x)

    number()


word()

# ========================================
print("\n========================================|||:")


def word2():
    string = 'Python returns from inner function as closure'
    x = 5

    def number():
        print(string)
        print(x)

    return number


word2()()

# ========================================
print("\n========================================|||:")


def functionA(name):
    name = "New name"

    def functionB():
        print(name)

    return functionB


myfunction = functionA("My name")
myfunction()

# ========================================nonlocal Keyword
print("\n========================================|||:nonlocal Keyword")


def functionA():
    counter = 0

    def functionB():
        nonlocal counter
        counter += 1
        return counter

    return functionB


myfunction = functionA()

retval = myfunction()
print("Counter:", retval)

retval = myfunction()
print("Counter:", retval)

retval = myfunction()
print("Counter:", retval)
