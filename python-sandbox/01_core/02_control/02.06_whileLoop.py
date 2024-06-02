#!/usr/bin/python3.12

count = 0
while count < 5:
    count += 1
    print("Iteration no. {}".format(count))

print("End of while loop")

# ----------------
print("\n|||:")

# var = '0'
# while var.isnumeric():
#    var = input('enter a number..')
#    if var.isnumeric():
#        print("Your input", var)
# print("End of while loop")

# ----------------Python Infinite while Loop
print("\n|||:Python Infinite while Loop")

# var = 1
# while var == 1:  # This constructs an infinite loop
#    num = int(input("Enter a number :"))
#    print("You entered: ", num)
# print("Good bye!")

# ----------------while-else Loop
print("\n|||:while-else Loop")

count = 0
while count < 5:
    count += 1
    print("Iteration no. {}".format(count))
else:
    print("While loop over. Now in else block")
print("End of while loop")

# ----------------Single Statement Suites
print("\n|||:Single Statement Suites")

flag = 0
while flag: print("Given flag is really true!")
print("Good bye!")

# ----------------Nested while Loop Example
print("\n|||:Nested while Loop Example")

i = 2
while i < 100:
    j = 2
    while j <= (i / j):
        if not (i % j): break
        j = j + 1
    if j > i / j:
        print(i, " is prime")
    i = i + 1

print
"Good bye!"
