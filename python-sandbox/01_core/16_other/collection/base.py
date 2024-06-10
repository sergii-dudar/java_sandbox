#!/usr/bin/python3.12

import collections
from collections import defaultdict
from collections import Counter
from collections import deque
from collections import ChainMap

# The Python OrderedDict() is similar to a dictionary object where keys maintain the order of insertion
d1 = collections.OrderedDict()
d1['A'] = 10
d1['C'] = 12
d1['B'] = 11
d1['D'] = 13

for k, v in d1.items():
    print(k, v)

# ========================================defaultdict
print("\n========================================|||:defaultdict")

# It provides all methods provided by dictionary but takes the first argument as a default data type
number = defaultdict(int)
number['one'] = 1
number['two'] = 2
print(number['three'])

# ========================================Counter
print("\n========================================|||:Counter")
# The Python Counter is a subclass of dictionary object which helps to count hashable objects.

c = Counter()
list1 = [1, 2, 3, 4, 5, 7, 8, 5, 9, 6, 10]
Counter(list1)
Counter({1: 5, 2: 4})
list1 = [1, 2, 4, 7, 5, 1, 6, 7, 6, 9, 1]
c = Counter(list1)
print(c[1])

# ========================================deque
print("\n========================================|||:deque")

list2 = ["x", "y", "z"]
deq = deque(list2)
print(deq)

# ========================================ChainMap
print("\n========================================|||:ChainMap")
# A chainmap class is used to groups multiple dictionary together to create a single list.
# The linked dictionary stores in the list and it is public and can be accessed by the map
# attribute. Consider the following example.


baseline = {'Name': 'Peter', 'Age': '14'}
adjustments = {'Age': '14', 'Roll_no': '0012'}
print(list(ChainMap(adjustments, baseline)))

# ========================================
print("\n========================================|||:")
