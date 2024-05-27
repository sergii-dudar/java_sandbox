#!/bin/bash

# + : Addition, measures addition of numbers (operands)
# res=$(( 10 + 3 ))
# or
((res = 10 + 3))
echo "\$(( 10 + 3 )) = $res" # 13

#((Sum=Num1+Num2)), Sum=$((Num1+Num2))

#-----------------------------------------------
# - : Substraction, measures subtraction of second operand from first
res=$((10 - 3))
echo "\$(( 10 - 3 )) = $res" # 7

#-----------------------------------------------
# * : Multiplication, measures the multiplication of operands.
res=$((10 * 3))
echo "\$(( 10 * 3 )) = $res" # 30

#-----------------------------------------------
# / : Division, measures the division of first operand by second operand and and return quotient.
res=$((10 / 3))
echo "\$(( 10 / 3 )) = $res" # 3

#-----------------------------------------------
# ** : Exponentiation, measures the result of second operand raised to the power of first operand.
res=$((10 ** 3))
echo "\$(( 10 ** 3 )) = $res" # 1000

#-----------------------------------------------
# % : Modulo, measures remainder when the first operand is divided by second operand.
res=$((10 % 3))
echo "\$(( 10 % 3 )) = $res" # 1

#-----------------------------------------------
# += : Increment Variable by Constant- used to increment the value of first operand by the constant provided.
x=10
((x += 3))
echo "((x += 3)) = $x" # 13

#-----------------------------------------------
# -= : Decrement Variable by Constant- used to decrement the value of first operand by the constant provided.
x=10
((x -= 3))
echo "((x -= 3)) = $x" # 7

#-----------------------------------------------
# *= : Multiply Variable by Constant- used to multiply the value of the first operand by the constant provided.
x=10
((x *= 3))
echo "((x *= 3)) = $x" # 30

#-----------------------------------------------
# /= : Divide Variable by Constant- used to calculate the value of (variable / constant) and store the result back to variable.
x=10
((x /= 3))
echo "((x /= 3)) = $x" # 3

#-----------------------------------------------
# %= : Remainder of Dividing Variable by Constant- used to calculate the value of (variable % constant) and store the result back to variable.
x=10
((x %= 3))
echo "((x %= 3)) = $x" #1

#---------------------------------------------------
#---------------------------------------------------
echo
echo

x=8
y=2
echo "x=8, y=2"
echo -n "Addition of x & y: "
echo $((x + y))
echo -n "Subtraction of x & y: "
echo $((x - y))
echo -n "Multiplication of x & y: "
echo $((x * y))
echo -n "Division of x by y: "
echo $((x / y))
echo -n "Exponentiation of x,y: "
echo $((x ** y))
echo -n "Modular Division of x,y: "
echo $((x % y))
echo -n "Incrementing x by 5, then x= : "
((x += 5))
echo $x
echo -n "Decrementing x by 5, then x= : "
((x -= 5))
echo $x
echo -n "Multiply of x by 5, then x= : "
((x *= 5))
echo $x
echo -n "Dividing x by 5, x= : "
((x /= 5))
echo $x
echo -n "Remainder of Dividing x by 5, x= : "
((x %= 5))
echo $x
