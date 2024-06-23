#!/usr/bin/python3.12

from typing import List, TypeVar, Generic

# ========================================
print("\n========================================|||:")

T = TypeVar('T')


def reverse(items: List[T]) -> List[T]:
    return items[::-1]


# ========================================
print("\n========================================|||:")
# https://www.tutorialspoint.com/python/python_socket_programming.htm
numbers = [1, 2, 3, 4, 5]
reversed_numbers = reverse(numbers)
print(reversed_numbers)

fruits = ['apple', 'banana', 'cherry']
reversed_fruits = reverse(fruits)
print(reversed_fruits)

# ========================================
print("\n========================================|||:")

T = TypeVar('T')

class Box(Generic[T]):
    def __init__(self, item: T):
        self.item = item

    def get_item(self) -> T:
        return self.item


# Let us create objects of the above generic class with int and str type
box1 = Box(42)
print(box1.get_item())

box2 = Box('Hello')
print(box2.get_item())
