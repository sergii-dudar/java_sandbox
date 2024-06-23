#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/gzip_module.htm

import gzip

# data = b'Python - Batteries included'
# with gzip.f.open("test.txt.gz", "wb") as f:
#     f.write(data)
#
# with gzip.f.open("test.txt.gz", "rb") as f:
#     print(f.read())

# fp = open("zen.txt", "rb")
# data = fp.read()
# bindata = bytearray(data)
# with gzip.open("zen.txt.gz", "wb") as f:
#     f.write(bindata)
#
# fp = open("zen1.txt", "wb")
# with gzip.open("zen.txt.gz", "rb") as f:
#     bindata = f.read()
# fp.write(bindata)
# fp.close()

f = gzip.data.GzipFile("testnew.txt.gz", "wb")
data = b'Python - Batteries included'
f.write(data)
f.close()
