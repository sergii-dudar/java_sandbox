#!/usr/bin/python3.12


#  We make both the arguments of intr() function as positional-only by putting "/" at the end.

def intr(amt, rate, /):
    val = amt * rate / 100
    return val


# intr(amt=1000, rate=10) will throw error
print(intr(1000, 10))


#  A function may be defined in such a way that it has some keyword-only and some positional-only arguments.

def myfunction(x, /, y, *, z):
    print(x, y, z)


myfunction(10, y=20, z=30)
myfunction(10, 20, z=30)
