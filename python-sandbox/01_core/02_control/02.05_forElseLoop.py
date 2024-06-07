#!/usr/bin/python3.12

for count in range(6):
    print("Iteration no. {}".format(count))
else:
    print("for loop over. Now in else block")
print("End of for loop")

# ======================================== For-Else Construct with normal termination (without break statement)
print(
    "\n|||: For-Else Construct with normal termination (without break statement)")

for i in ['T', 'P']:
    print(i)
else:
    # Loop else statement
    # there is no break statement in for loop, hence else part gets executed directly
    print("ForLoop-else statement successfully executed")

# ========================================For-Else Construct with forceful termination (with break statement)
print(
    "\n|||:For-Else Construct with forceful termination (with break statement)")

for i in ['T', 'P']:
    print(i)
    break
else:
    # Loop else statement
    # terminated after 1st iteration due to break statement in for loop
    print("Loop-else statement successfully executed")

# ========================================For-Else Construct with break statement and if conditions
print("\n========================================|||:For-Else Construct with break statement and if conditions")


# creating a function to check whether the list item is a positive
# or a negative number
def positive_or_negative():
    # traversing in a list
    for i in [5, 6, 7]:
        # checking whether the list element is greater than 0
        if i >= 0:
            # printing positive number if it is greater than or equal to 0
            print("Positive number")
        else:
            # Else printing Negative number and breaking the loop
            print("Negative number")
            break
    # Else statement of the for loop
    else:
        # Statement inside the else block
        print("Loop-else Executed")


# Calling the above-created function
positive_or_negative()

# ========================================Using else statement with while loop in python
print("\n========================================|||:Using else statement with while loop in python")

k = 0
# traversing until the condition is true(k<8)
while k < 8:
    # incrementing the k value by 1
    k += 1
    # printing k value
    print("k =", k)
else:
    # else block gets executed when the condition fails(becomes false)
    print("This is an else block")

# ========================================Using Else statement in While loop with a break statement
print("\n========================================|||:Using Else statement in While loop with a break statement")


# creating a function that checks if the
# list passed to it contains an even number
def hasEvenNumber(l):
    # getting the list length
    n = len(l)
    # intializing a variable with 0(index)
    i = 0
    # traversing the loop until the I value is less than the list length
    while i < n:
        # checking whether the corresponding index element of a list is even

        if l[i] % 2 == 0:
            # printing some text, if the condition is true
            print("The input list contains an even number")

            # giving a break statement/break the loop

            break

            # incrementing the I (index) value by 1

        i += 1

    else:
        # Else print "The input list doesn't contain an even number"
        # It executes Only if the break is NEVER met and the loop is terminated after all iterations

        print("The input list doesn't contain an even number")


# calling the hasEvenNumber() function by passing input list 1 as an argument
print("For Input list 1:")
hasEvenNumber([3, 9, 4, 5])
# calling the hasEvenNumber() function by passing input list 2 as an argument
print("For Input list 2:")
hasEvenNumber([7, 3, 5, 1])

# ========================================Nested Loops in Python
print("\n========================================|||:Nested Loops in Python")

for i in range(1, 11):
    for j in range(1, 11):
        k = i * j
        print("{:3d}".format(k), end=' ')
    print()

# ========================================For each multiple lists
print("\n========================================|||:For each multiple lists")

# for x in [(1, 2, 3), (5, 6, 7), (9, 10, 11)]:
#     print(x)
