#!/usr/bin/python3.12

# Syntax
# def generator():
#  . . .
#  . . .
#  yield obj
# it = generator()
# next(it)
# . . .

def generator(num):
    for x in range(1, num + 1):
        yield x
    return


it = generator(5)
while True:
    try:
        print(next(it))
    except StopIteration:
        break

# ========================================normal function to get a list of Fibonacci numbers
print("\n========================================|||:normal function to get a list of Fibonacci numbers")


def fibonacci(n):
    fibo = []
    a, b = 0, 1
    while True:
        c = a + b
        if c >= n:
            break
        fibo.append(c)
        a, b = b, c
    return fibo


f = fibonacci(10)
for i in f:
    print(i)

# ========================================generator-based solution for list of Fibonacci numbers
print("\n========================================|||:generator-based solution for list of Fibonacci numbers")


def fibonacci(n):
    a, b = 0, 1
    while True:
        c = a + b
        if c >= n:
            break
        yield c
        a, b = b, c
    return


f = fibonacci(10)
while True:
    try:
        print(next(f))
    except StopIteration:
        break

