#!/usr/local/bin/lua

----------------------------
---- Assert and Error Functions

local function add(a, b)
    assert(type(a) == "number", "a is not a number")
    --assert(type(b) == "number", "b is not a number")
    if type(b) ~= "number" then
        error("b is not a number")
    end

    return a + b
end

--add(10)

--------------------------
----pcall

function myfunction ()
    n = n / nil
end

if pcall(myfunction) then
    print("Success")
else
    print("Failure")
end

local status, err = pcall(function () error({code=121}) end)
print("code: "..err.code)

-------------------------
---- xpcall
print()
function myerrorhandler( err )
    print( "ERROR:", err )
end

status = xpcall( myfunction, myerrorhandler )
print( status )

