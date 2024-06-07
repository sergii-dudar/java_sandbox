#!/usr/bin/python3.12

# ========================================
print("\n========================================|||:")

import queue as qu

# Creating a queue object with maxsize argument
queueObject = qu.Queue(maxsize=6)
# Inserting five elements in the queue of integer data type
queueObject.put(6)
queueObject.put(31)
queueObject.put(26)
queueObject.put(18)
queueObject.put(24)
# Now getting elements in the output
print('The first element inserted in the queue object created: ', queueObject.get())
print('The second element inserted in the queue object: ', queueObject.get())
print('The third element inserted in the queue object: ', queueObject.get())
print('The fourth element inserted in the queue object: ', queueObject.get())
print('The fifth element inserted in the queue object: ', queueObject.get())

# ========================================
print("\n========================================|||:")

# Creating a queue object with maxsize argument
quObject = qu.Queue(maxsize=5)
# Inserting elements in the queue of integer data type
quObject.put(6)
quObject.put(31)
quObject.put(26)
quObject.put(18)
# Checking if the queue is full or not
print('Is the given queue object is full according to the maximum size of it?: ', quObject.full())
# Inserting one more element
quObject.put(24)
# Again, checking that queue is full
print('Is the given queue object is now full as its maximum size?: ', quObject.full())
# Checking size of the queue object
quSize = quObject.qsize()
print('The maximum size of the created queue object is: ', quSize)
# Now getting elements out from the queue object
print('The first element inserted in the queue object created: ', quObject.get())
print('The second element inserted in the queue object: ', quObject.get())
print('The third element inserted in the queue object: ', quObject.get())
# Checking for empty queue object
print('Is the given queue object is empty?: ', quObject.empty())
# Getting more elements out from the queue
print('The fourth element inserted in the queue object: ', quObject.get())
print('The fifth element inserted in the queue object: ', quObject.get())
# Again, Checking for empty queue object
print('Is the given queue object is empty now?: ', quObject.empty())

# ========================================
print("\n========================================|||:")

# Creating a stack data structure object with maxsize argument equal to 8
stackObj = qu.LifoQueue(maxsize=8)
# Inserting elements of integer data type in the stack object
stackObj.put(12)
stackObj.put(5)
stackObj.put(23)
stackObj.put(6)
stackObj.put(31)
# Checking if the stack object is full or not for overflow condition prevention
print('Is the given queue object is full according to the maximum size of it?: ', stackObj.full())
# Inserting some more elements inside the stack object
stackObj.put(26)
stackObj.put(18)
stackObj.put(24)
# Again, checking that if the stack object is full or not
print('Is the given stack object is now full according to its maximum size?: ', stackObj.full())
# Checking the maximum size of the stack object after Inserting all elements
stackSize = stackObj.qsize()
print('The maximum size of the stack object created in the program is: ', stackSize)
# Now getting elements out from the stack object in the LIFO manner
print('The last element inserted in the stack object: ', stackObj.get())
print('The last second element inserted in the stack object: ', stackObj.get())
print('The sixth element inserted in the stack object: ', stackObj.get())
print('The fifth element inserted in the stack object: ', stackObj.get())
# Checking that if stack object has become empty
print('Is the given stack object have become empty?: ', stackObj.empty())
# Getting more elements out from the stack object
print('The fourth element inserted in the stack object: ', stackObj.get())
print('The third element inserted in the stack object: ', stackObj.get())
print('The second element inserted in the stack object: ', stackObj.get())
print('The first element inserted in the stack object created: ', stackObj.get())
# Again Checking for the empty stack object
print('Is the given stack object in the program is empty now?: ', stackObj.empty())
