#!/usr/bin/python3.12

import sys

# name = input()
# is equivalent to

# name = sys.stdin.readline()

fo = open("foo.txt", "wb")
print("Name of the file: ", fo.name)
print("Closed or not: ", fo.closed)
print("Opening mode: ", fo.mode)
fo.close()

# files operations: https://www.tutorialspoint.com/python/python_file_methods.htm
# https://www.tutorialspoint.com/python/os_file_methods.htm
# https://www.tutorialspoint.com/python/os_path_methods.htm

# file opening modes:
# r   - Opens a file for reading only. The file pointer is placed at the beginning of the file. This is the default mode.
# rb  - Opens a file for reading only in binary format. The file pointer is placed at the beginning of the file. This is the default mode.
# r+  - Opens a file for both reading and writing. The file pointer placed at the beginning of the file.
# rb+ - Opens a file for both reading and writing in binary format. The file pointer placed at the beginning of the file.
# w   - Opens a file for writing only. Overwrites the file if the file exists. If the file does not exist, creates a new file for writing.
# b   - Opens the file in binary mode
# t   - Opens the file in text mode (default)
# +   - open file for updating (reading and writing)
# wb  - Opens a file for writing only in binary format. Overwrites the file if the file exists. If the file does not exist, creates a new file for writing.
# w+  - Opens a file for both writing and reading. Overwrites the existing file if the file exists. If the file does not exist, creates a new file for reading and writing.
# wb+ - Opens a file for both writing and reading in binary format. Overwrites the existing file if the file exists. If the file does not exist, creates a new file for reading and writing.
# a   - Opens a file for appending. The file pointer is at the end of the file if the file exists. That is, the file is in the append mode. If the file does not exist, it creates a new file for writing.
# ab  - Opens a file for appending in binary format. The file pointer is at the end of the file if the file exists. That is, the file is in the append mode. If the file does not exist, it creates a new file for writing.
# a+  - Opens a file for both appending and reading. The file pointer is at the end of the file if the file exists. The file opens in the append mode. If the file does not exist, it creates a new file for reading and writing.
# ab+ - Opens a file for both appending and reading in binary format. The file pointer is at the end of the file if the file exists. The file opens in the append mode. If the file does not exist, it creates a new file for reading and writing.
# x - open for exclusive creation, failing if the file already exists
