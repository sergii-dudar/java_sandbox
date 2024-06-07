#!/usr/bin/python3.12
# https://www.javatpoint.com/deque-in-python

# importing the collections library
# for deque operations
import collections
from collections import deque

# ========================================
print("\n========================================|||:")

# declaring the deque
fruit_list = deque(['Apple', 'Mango', 'Peaches', 'Banana', 'Papaya'])

# printing the deque
print(fruit_list)

# ========================================
print("\n========================================|||:")

# declaring the deque
my_deque = collections.deque([10, 20, 30, 40, 50])

# using the append() function to add
# data element at right end
# inserting 60 at the end of the deque
my_deque.append(60)

# printing the resultant deque
print("The deque after appending at right: ")
print(my_deque)

# using the appendleft() function to add
# data element at left end
# inserting 70 at the starting of the deque
my_deque.appendleft(70)

# printing the resultant deque
print("The deque after appending at left: ")
print(my_deque)

# using the pop() function to remove
# data element from the right end
# removing 60 from the right end of deque
my_deque.pop()

# printing the resultant deque
print("The deque after removing from right: ")
print(my_deque)

# using the popleft() function to remove
# data element from the left end
# removing 70 from the left end of deque
my_deque.popleft()

# printing the resultant deque
print("The deque after removing from left: ")
print(my_deque)

# ========================================
print("\n========================================|||:")

# declaring the deque
my_deque = collections.deque(['Jan', 'Feb', 'Mar', 'Mar', 'Feb', 'April', 'Feb'])

# using the index() function to print
# the first occurrence of data element: Feb
print("The first occurs of 'Feb' at a position: ")
print(my_deque.index('Feb', 2, 7))

# using the insert() function to insert
# the data element 'Jan' at 4th position
my_deque.insert(3, 'Jan')

# printing the resultant deque
print("The deque after inserting 'Jan' at 4th position: ")
print(my_deque)

# using the count() function to count
# the occurrences of data element 'Feb'
print("The count of 'Feb' in deque: ")
print(my_deque.count('Feb'))

# using the remove() function to remove
# the first occurrence of data element 'Mar'
my_deque.remove('Mar')

# printing the resultant deque
print("The deque after removing the first occurrence of 'Mar': ")
print(my_deque)
