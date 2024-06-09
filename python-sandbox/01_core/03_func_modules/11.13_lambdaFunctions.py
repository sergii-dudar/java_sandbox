#!/usr/bin/python3.12

add = lambda num: num + 4
print(add(6))

a = lambda x, y: (x * y)
print(a(4, 5))

a = lambda x, y, z: (x + y + z)
print(a(4, 5, 5))


def reciprocal(num):
    return 1 / num


lambda_reciprocal = lambda num: 1 / num

# using the function defined by def keyword
print("Def keyword: ", reciprocal(6))

# using the function defined by lambda keyword
print("Lambda keyword: ", lambda_reciprocal(6))

# ========================================Using Lambda Function with filter()
print(
    "\n========================================|||:Using Lambda Function with filter()")

list_ = [35, 12, 69, 55, 75, 14, 73]
odd_list = list(filter(lambda num: (num % 2 != 0), list_))
print('The list of odd number is:', odd_list)

numbers_list = [2, 4, 5, 1, 3, 7, 8, 9, 10]
squared_list = list(map(lambda num: num ** 2, numbers_list))
print('Square of each number in the given list:', squared_list)

# ========================================Using Lambda Function with List Comprehension
print(
    "\n========================================|||:Using Lambda Function with List Comprehension")

squares = [lambda num=num: num ** 2 for num in range(0, 11)]
for square in squares:
    print('The square value of all numbers from 0 to 10:', square(), end=" ")

# ========================================Using Lambda Function with if-else
print(
    "\n========================================|||:Using Lambda Function with if-else")

minimum = lambda x, y: x if (x < y) else y
print('The greater number is:', minimum(35, 74))

# ========================================Using Lambda with Multiple Statements
print(
    "\n========================================|||:Using Lambda with Multiple Statements")

my_List = [[3, 5, 8, 6], [23, 54, 12, 87], [1, 2, 4, 12, 5]]

# sorting every sublist of the above list
sort_List = lambda num: (sorted(n) for n in num)

# Getting the third largest number of the sublist
third_Largest = lambda num, func: [l[len(l) - 2] for l in func(num)]

result = third_Largest(my_List, sort_List)
print('The third largest number from every sub list is:', result)

# ========================================
print("\n========================================|||:")
