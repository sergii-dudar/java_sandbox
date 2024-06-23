#!/usr/bin/python3.12
import os

# getPath = lambda fileName: os.path.join(os.getcwd(), fileName)
# print(getPath("file.txt"))

# modes:
# x: it creates a new file with the specified name. It causes an error a file exists with the same name.
# a: It creates a new file with the specified name if no such file exists. It appends the content to the file if the file already exists with the specified name.
# w: It creates a new file with the specified name if no such file exists. It overwrites the existing file.


file = open('file.txt', 'w')
try:
    file.write("Here we write a command")
    file.write("Hello users of JAVATPOINT")
finally:
    file.close()

# `with` statement
# It is always suggestible to use the with statement in the case of files
# because, if the break, return, or exception occurs in the nested block of
# code then it automatically closes the file, we don't need to write the close() function. It doesn't let the file to corrupt.

# Syntax:
# with open(<file name>, <access mode>) as <file-pointer>:
#    statement suite

print("with: ")
with open("file.txt", "w") as f:
    f.write('Hello coders')
    f.write('Welcome to javaTpoint')

with open("file.txt", 'r') as f:
    content = f.read()
    print(content)

# ========================================Read file through for loop
print(
    "\n========================================|||:Read file through for loop")
with open("file.txt", "r") as f:
    # running a for loop
    for i in f:
        print(i)  # i contains each line of the file

print("###")

listLines = ["Hello\n", "Coders\n", "JavaTpoint\n"]
with open('myfile.txt', 'w') as f1:
    f1.writelines(listLines)

with open('myfile.txt', 'r') as f1:
    content = f1.read()
    print(content)

# ========================================Read Lines of the file
print("\n========================================|||:Read Lines of the file")

with open('myfile.txt', 'r') as f1:
    print(f1.readlines())

with open('myfile.txt', 'r') as f1:
    for line in f1.readlines():
        print(line, end="")

# ========================================
print("\n========================================|||:")


def existsTest(fileName):
    if os.path.exists(fileName):
        # os.remove("file3.txt ")
        print("This file is exists")
    else:
        print("This file is not existed")


existsTest("myfile.txt")
existsTest("myfileNot.txt")

# ========================================
print("\n========================================|||:")

# ========================================
print("\n========================================|||:")
