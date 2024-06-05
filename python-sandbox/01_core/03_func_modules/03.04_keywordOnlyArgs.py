#!/usr/bin/python3.12

def intr(amt, *, rate):
    val = amt * rate / 100
    return val


print(intr(1000, rate=10))
#  intr(1000, 10) will throw error
