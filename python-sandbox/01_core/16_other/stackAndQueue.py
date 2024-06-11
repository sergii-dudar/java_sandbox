#!/usr/bin/python3.12

# https://www.javatpoint.com/python-stack-and-queue

import queue

# ========================================Stack
print("\n========================================|||:Stack")
# LIFO(Last In First Out)

# push - It adds an element to the top of the stack.
# pop - It removes an element from the top of the stack.

# Code to demonstrate Implementation of stack using list

# x = ["Python", "C", "Android"]
# x.push("Java")
# x.push("C++")
# print(x)
# print(x.pop())
# print(x)
# print(x.pop())
# print(x)

# ========================================Queue
print("\n========================================|||:Queue")
# First-in-First-Out (FIFO)

# enqueue - It adds an element to the end of the queue.
# dequeue - It removes the element from the beginning of the queue.

qu = queue.Queue(maxsize=10)

# Data is inserted in 'L' at the end using put()
qu.put(9)
qu.put(6)
qu.put(7)
qu.put(4)
# get() takes data from
# from the head
# of the Queue
print(qu.get())
print(qu.get())
print(qu.get())
print(qu.get())
