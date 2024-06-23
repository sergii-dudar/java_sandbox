#!/usr/bin/python3.12

# https://www.tutorialspoint.com/python/bz2_module.htm

import bz2
data=[b'Hello World', b'How are you?', b'welcome to Python']
obj=bz2.BZ2Compressor()
f=bz2.open("test.bz2", "wb")
d1=obj.compress(data[0])
d2=obj.compress(data[1])
d3=obj.compress(data[2])
d4=obj.flush()

compressedobj=d1+d2+d3+d4
f.write(compressedobj)
f.close()