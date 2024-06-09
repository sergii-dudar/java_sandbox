#!/usr/bin/python3.12

def word():
    string = 'Python functions tutorial'
    x = 5

    def number():
        print(string)
        print(x)

    number()


word()


def word2():
    string = 'Python returns from inner function as closure'
    x = 5

    def number():
        print(string)
        print(x)

    return number


word2()()
