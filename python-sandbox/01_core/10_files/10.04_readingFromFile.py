#!/usr/bin/python3.12

import struct

# ========================================Read a File
print("\n========================================|||:Read a File")

with open("foo.txt", "r") as fo:
    text = fo.read()
    print(text)

# ========================================Read a File in Binary Mode
print("\n========================================|||:Read a File in Binary Mode")

with open('test.bin', 'wb') as f:
    data = b"Hello World"
    f.write(data)
    f.close()

with open('test.bin', 'rb') as f:
    data = f.read()
    print(data.decode(encoding='utf-8'))

# ========================================Read Numbers (Integer Data) From a File
print("\n========================================|||:Read Numbers (Integer Data) From a File")

n = 25
with open('test.bin', 'wb') as f:
    data = n.to_bytes(8, 'big')
    f.write(data)

with open('test.bin', 'rb') as f:
    data = f.read()
    n = int.from_bytes(data, 'big')
    print(n)

# ========================================Read Numbers (Float Data) From a File
print("\n========================================|||:Read Numbers (Float Data) From a File")

# x = 23.50
# with struct.pack('f', x) as data:
#     f = open('test.bin', 'wb')
#     f.write(data)
#
# with open('test.bin', 'rb') as f:
#     data = f.read()
#     x = struct.unpack('f', data)
#     print(x)

# ========================================Read File Using Reading and Writing (r+) Mode
print("\n========================================|||:Read File Using Reading and Writing (r+) Mode")

with open("foo.txt", "r+") as fo:
    fo.seek(10, 0)
    data = fo.read(3)
    print(data)

# ========================================Read a File from Specific Offset
print("\n========================================|||:Read a File from Specific Offset")

# Open a file in read-write mode
with open("foo.txt", "w+") as fo:
    fo.write("This is a rat race")
    fo.seek(10, 0)
    data = fo.read(3)
    print(data)
    fo.seek(10, 0)
    fo.write('cat')
    fo.seek(0, 0)
    data = fo.read()
    print(data)
