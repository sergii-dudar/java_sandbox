#!/usr/bin/python3.12

from array import *

# ========================================remove by value
print("\n========================================|||:remove by value")

# creating array
numericArray = array('i', [111, 211, 311, 411, 511])

# before removing array
print("Before removing:", numericArray)
# removing array
numericArray.remove(311)
# after removing array
print("After removing:", numericArray)

# ========================================Remove Items from Specific Indices
print("\n========================================|||:Remove Items from Specific Indices")

# creating array
numericArray = array('i', [111, 211, 311, 411, 511])

# before removing array
print("Before removing:", numericArray)
# removing array
numericArray.pop(3)
# after removing array
print("After removing:", numericArray)
