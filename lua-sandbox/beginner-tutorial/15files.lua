#!/usr/local/bin/lua

--[[
OPEN: Mode & Description:
"r"  - Read-only mode and is the default mode where an existing file is opened.
"w"  - Write enabled mode that overwrites the existing file or creates a new file.
"a"  - Append mode that opens an existing file or creates a new file for appending.
"r+" - Read and write mode for an existing file.
"w+" - All existing data is removed if file exists or new file is created with read write permissions.
"a+" - Append mode with read mode enabled that opens an existing file or creates a new file.

READ: Mode & Description:
"*n"  - Reads from the current file position and returns a number if exists at the file position or returns nil.
"*a"  - Returns all the contents of file from the current file position.
"*l"  - Reads the line from the current file position, and moves file position to next line.
number - Reads number of bytes specified in the function.

Other common I/O methods:
- io.tmpfile() − Returns a temporary file for reading and writing that will be removed once the program quits.
- io.type(file) − Returns whether file, closed file or nil based on the input file.
- io.flush() − Clears the default output buffer.
- io.lines(optional file name) − Provides a generic for loop iterator that loops through the file and closes the file in the end, in case the file name is provided or the default file is used and not closed in the end of the loop.

- file:seek(optional whence, optional offset) − Whence parameter is "set", "cur" or "end". Sets the new file pointer with the updated file position from the beginning of the file. The offsets are zero-based in this function. The offset is measured from the beginning of the file if the first argument is "set"; from the current position in the file if it's "cur"; or from the end of the file if it's "end". The default argument values are "cur" and 0, so the current file position can be obtained by calling this function without arguments.
- file:flush() − Clears the default output buffer.
- io.lines(optional file name) − Provides a generic for loop iterator that loops through the file and closes the file in the end, in case the file name is provided or the default file is used and not closed in the end of the loop.

]]--


function readFile(filePath)
    local file = io.open(filePath, "r")
    if not file then
        return nil
    end

    -- Read the file content in chunks using a loop
    local result = ""
    io.input(file)
    local line = io.read();
    while line do
        result = result .. line .. '\n'
        line = io.read()
    end
    return result
end

local function readFile2(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then
        return nil
    end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

local function seekFile(path)
    local file = io.open(path, "r")
    if not file then
        return nil
    end
    --file:seek("end",-25)
    file:seek("set",10)
    local content = file:read("*a")
    file:close()
    return content
end

local function append(path)
    -- Opens a file in append mode
    local file = io.open(path, "a")
    file:write "-- End of the test.lua file\n"
    file:close(file)
end


-- Opens a file in read
filePath = "io/tests/test.lua"

append(filePath)

--local content = readFile(filePath)
local content = readFile2(filePath)
--local content = seekFile(filePath)
if content then

    print(string.format("The content of file '%s' is: \n%s", filePath, content));

else
    -- Handle the error if the file couldn't be opened
    print("Error opening file!")
end

-- Opens a file in append mode
--file = io.open("test.lua", "a")

-- sets the default output file as test.lua
--io.output(file)

-- appends a word test to the last line of the file
--io.write("-- End of the test.lua file")

-- closes the open file
--io.close(file)