#!/usr/bin/python3.12

# [true_condition] if [expression] else [false_condition]

cust_age = 40
cust_discount = "Eligible for Discount" if cust_age >= 60 else "Not Eligible for Discount"
print(cust_discount)
cust_discount = 20 if cust_age >= 60 else 10
print("The Discount provided to the customer:", cust_discount)

name = "Alice"
greeting = "Hello, Alice!" if name == "Alice" else "Hello, stranger!"
print(greeting)  # Output: Hello, Alice!

x = 5
y = 10

min_value = x if x < y else y
print(min_value)  # Output: 5

# ========================================#  Nested Ternary Operator:
print(
    "\n========================================|||:#  Nested Ternary Operator:")

a = 10
b = 20
c = 30

max_value = a if (a > b and a > c) else (b if b > c else c)
print(max_value)  # Output: 30

# ========================================Conditional Assignment in List Comprehensions:
print(
    "\n========================================|||:Conditional Assignment in List Comprehensions:")

numbers = [1, 2, 3, 4, 5]
even_odd = ["even" if num % 2 == 0 else "odd" for num in numbers]
print(even_odd)  # Output: ['odd', 'even', 'odd', 'even', 'odd']
