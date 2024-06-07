#!/usr/bin/python3.12

tup1 = ("Rohan", "Physics", 21, 69.75)
tup2 = (1, 2, 3, 4, 5)
tup3 = ("a", "b", "c", "d")
tup4 = (25.50, True, -55, 1 + 2j)
tup5 = ()
tup6 = (
    50,)  # To write a tuple containing a single value you have to include a comma, even though there is only one value

# ========================================Accessing Values in Tuples
print("\n========================================|||:Accessing Values in Tuples")

tup1 = ('physics', 'chemistry', 1997, 2000);
tup2 = (1, 2, 3, 4, 5, 6, 7)
print("tup1[0]: ", tup1[0])
print("tup2[1:5]: ", tup2[1:5])

# ========================================Updating Tuples
print("\n========================================|||:Updating Tuples")

tup1 = (12, 34.56)
tup2 = ('abc', 'xyz')

# Following action is not valid for tuples
# tup1[0] = 100;

# So let's create a new tuple as follows
tup3 = tup1 + tup2
print(tup3)

# ========================================Delete Tuple Elements
print("\n========================================|||:Delete Tuple Elements")

tup = ('physics', 'chemistry', 1997, 2000)
print(tup)
del tup
print("After deleting tup : ")
# print(tup)

# ========================================Python Tuple Operations
print("\n========================================|||:Python Tuple Operations")

print((1, 2, 3) + (4, 5, 6))  # (1, 2, 3, 4, 5, 6):	Concatenation
print(('Hi!',) * 4)  # ('Hi!', 'Hi!', 'Hi!', 'Hi!'):	Repetition
print(3 in (1, 2, 3))  # True:	Membership

# ========================================Indexing, Slicing, and Matrixes
print("\n========================================|||:Indexing, Slicing, and Matrixes")

L = ('spam', 'Spam', 'SPAM!')
print(L[2])  # 'SPAM!'	Offsets start at zero
print(L[-2])  # 'Spam'	Negative: count from the right
print(L[1:])  # ['Spam', 'SPAM!']	Slicing fetches sections

# ========================================No Enclosing Delimiters
print("\n========================================|||:No Enclosing Delimiters")

# Any set of multiple objects, comma-separated, written without identifying symbols, i.e.,
# brackets for lists, parentheses for tuples, etc., default to tuples, as indicated in these
# short examples:

tuple1 = 'abc', -4.24e93, 18 + 6.6j, 'xyz'
print(tuple1)

x, y = 1, 2
print("Value of x , y : ", x, y)

# ========================================Loop Through Tuple Items
print("\n========================================|||:Loop Through Tuple Items")

tup1 = (25, 12, 10, -21, 10, 100)
for num in tup1:
    print(num, end=' ')

# ========================================Loop Through Tuple Items using Index
print("\n========================================|||:Loop Through Tuple Items using Index")

tup1 = (25, 12, 10, -21, 10, 100)
indices = range(len(tup1))
for i in indices:
    print("tup1[{}]: ".format(i), tup1[i])

# ========================================Finding the Index of a Tuple Item
print("\n========================================|||:Finding the Index of a Tuple Item")

tup1 = (25, 12, 10, -21, 10, 100)
print("Tup1:", tup1)
x = tup1.index(10)
print("First index of 10:", x)

# ========================================Counting Tuple Items
print("\n========================================|||:Counting Tuple Items")

tup1 = (10, 20, 45, 10, 30, 10, 55)
print("Tup1:", tup1)
c = tup1.count(10)
print("count of 10:", c)

tup1 = (10, 20 / 80, 0.25, 10 / 40, 30, 10, 55)
print("Tup1:", tup1)
c = tup1.count(0.25)
print("count of 10:", c)

# ========================================
print("\n========================================|||:")
