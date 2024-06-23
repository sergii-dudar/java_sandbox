#!/usr/bin/python3.12

# ========================================Writing to a New File
print("\n========================================|||:Writing to a New File")

# Open a file
with open("foo.txt", "w") as fo:
    fo.write("Python is a great language.\nYeah its great!!\n")

# ========================================Writing to a New File in Binary Mode
print("\n========================================|||:Writing to a New File in Binary Mode")
# If we want to handle files of different other types such as media (mp3), executables (exe),
# pictures (jpg) etc., we need to add 'b' prefix to read/write mode.


with open('test.bin', 'wb') as f:
    f.write(b"Hello World")

# ========================================Writing to an Existing File
print("\n========================================|||:Writing to an Existing File")

with open("foo.txt", "a") as fo:
    text = "TutorialsPoint has a fabulous Python tutorial"
    fo.write(text)

# ========================================Writing to a File in Reading and Writing Modes
print("\n========================================|||:Writing to a File in Reading and Writing Modes")

# Open a file in read-write mode
with open("foo.txt", "w+") as fo:
    fo.write("This is a rat race")
    fo.seek(10, 0)
    data = fo.read(3)
    fo.seek(10, 0)
    fo.write('cat')
