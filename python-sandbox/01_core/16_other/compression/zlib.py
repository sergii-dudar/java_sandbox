#!/usr/bin/python3.12

import zlib

data = b'Hello TutorialsPoint'
compressed = zlib.compress(data)
print("Compressed:", compressed)
decompressed = zlib.decompress(compressed)
print("Decompressed:", decompressed)
