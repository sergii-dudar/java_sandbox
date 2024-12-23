local work_buffer_types = { java = true }

local function boolean_to_string(value)
    return value and "true" or "false"
end

local function is_filetype_in_range(filetype)
    return work_buffer_types[filetype] ~= nil
end

local type = "java"
print(work_buffer_types[type])
print(is_filetype_in_range("java"))
