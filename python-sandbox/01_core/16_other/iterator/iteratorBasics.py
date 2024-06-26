#!/usr/bin/python3.12

class Squares:
    def __init__(self, limit):
        self.limit = limit
        self.n = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.n <= self.limit:
            square = self.n ** 2
            self.n += 1
            return square
        else:
            raise StopIteration


numbers = Squares(5)
for n in numbers:
    print(n)
