#!/usr/bin/python3.12

from threading import Lock
from contextlib import contextmanager

with open('example.txt', 'r') as file:
    content = file.read()
    print(content)

# ========================================db connections
print("\n========================================|||:db connections")

# import sqlite3
#
# with sqlite3.connect('example.db') as connection:
#     cursor = connection.cursor()
#     cursor.execute('SELECT * FROM my_table')
#     rows = cursor.fetchall()
#     for row in rows:
#         print(row)

# ========================================managing locks
print("\n========================================|||:managing locks")

# Ensuring that a lock is acquired and released properly.
lock = Lock()

with lock:
    # critical section of code
    print('Lock is acquired and released properly')

# ========================================Custom Context Managers
print("\n========================================|||:Custom Context Managers")


# A class-based context manager requires __enter__ and __exit__ methods.

class MyContextManager:
    def __enter__(self):
        print('-->Entering the context')
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        print('-->Exiting the context')


with MyContextManager() as manager:
    print('---->Inside the context')

# ========================================Using contextlib Module
print("\n========================================|||:Using contextlib Module")


@contextmanager
def my_context():
    print('-->Entering the context')
    try:
        yield
        # pass
    finally:
        print('-->Exiting the context')


with my_context():
    print('---->Inside the context')

# ========================================Example of a Custom Context Manager with Exception Handling
print("\n========================================|||:Example of a Custom Context Manager with Exception Handling")


class MyContextManager:
    def __enter__(self):
        print('-->Entering the context')
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        if exc_type:
            print(f'xx>An exception occurred: {exc_value}')
            return True  # Suppress the exception
        print('-->Exiting the context')


with MyContextManager() as manager:
    print('---->Inside the context')
    raise ValueError('An error occurred')
