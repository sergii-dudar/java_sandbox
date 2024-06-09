"""The docstring of mymodule"""


def sum(x, y):
    return x + y


def average(x, y):
    return (x + y) / 2


def power(x, y):
    return x ** y


# in case we don't want to run it, if this file imports as module
if __name__ == "__main__":
    print("from module: __name__ attribute within a script:", __name__)
