#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/python_interthread_communication.htm

from threading import *
import time
import random

numbers = []


def taskA(c):
    while True:
        c.acquire()
        num = random.randint(1, 10)
        print("Generated random number:", num)
        numbers.append(num)
        print("Notification issued")
        c.notify()
        c.release()
        time.sleep(5)


def taskB(c):
    while True:
        c.acquire()
        print("waiting for update")
        c.wait()
        print("Obtained random number", numbers.pop())
        c.release()
        time.sleep(5)


c = Condition()
t1 = Thread(target=taskB, args=(c,))
t2 = Thread(target=taskA, args=(c,))
t1.start()
t2.start()
