#!/usr/bin/python3.12

# Defining a set with multiple elements
my_set = {25, 12, 10, -21, 10, 100}

# Loop through each item in the set
for item in my_set:
    # Performing operations on each element
    print("Item:", item)

# ======================================== While Loop
print("\n========================================|||:While Loop")

# Defining a set with multiple elements
my_set = {1, 2, 3, 4, 5}

# Converting the set to an iterator
set_iterator = iter(my_set)

# Looping through each item in the set using a while loop
while True:
    try:
        # Getting the next item from the iterator
        item = next(set_iterator)
        # Performing operations on each element
        print("Item:", item)
    except StopIteration:
        # If StopIteration is raised, break from the loop
        break

# ========================================Iterate using Set Comprehension
print(
    "\n========================================|||:Iterate using Set Comprehension")

# Original list
numbers = [1, 2, 3, 4, 5]

# Set comprehension to create a set of squares of even numbers
squares_of_evens = {x ** 2 for x in numbers if x % 2 == 0}
# Print the resulting set
print(squares_of_evens)

# ========================================Using the enumerate() Function
print(
    "\n========================================|||:Using the enumerate() Function")
# The enumerate() function in Python is used to iterate over an iterable object while also providing the index of each element.

# Converting the set into a list
my_set = {1, 2, 3, 4, 5}
set_list = list(my_set)

# Iterating through the list
for index, item in enumerate(set_list):
    print("Index:", index, "Item:", item)

# ========================================
print("\n========================================|||:")

# Creating an empty set
my_set = set()

# Looping through a sequence and adding elements to the set
for i in range(5):
    my_set.add(i)
print(my_set)
