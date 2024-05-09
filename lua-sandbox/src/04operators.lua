A = 10
B = 20

a = "Hello "
b = "World"

-- all same, just couple next operators have diff view

print(A == B)
print(A ~= B) -- !=

-- Logical
print("\n")
print(A and B) -- && -- Called Logical AND operator. If both the operands are non zero then condition becomes true.
print(A or B) -- || -- Called Logical OR Operator. If any of the two operands is non zero then condition becomes true.
print(~(A and B)) -- Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true then Logical NOT operator will make false.

-- Misc Operators
print("\n")
print(a..b) -- Concatenates two strings.
print(#"Hello") --An unary operator that return the length of the a string or a table.