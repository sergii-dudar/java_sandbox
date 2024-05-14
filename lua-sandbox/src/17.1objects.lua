-- class type definition
Rectangle = { area = 0, length = 0, breadth = 0 }

-- class constructor
function Rectangle:new (o, length, breadth)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.length = length or 0
    self.breadth = breadth or 0
    self.area = length * breadth;
    return o
end

-- class method
function Rectangle:printArea ()
    return self.area;
end

local obj = Rectangle:new(nil, 10, 20);
print("area: ", obj.area)
print("method call: ", obj:printArea())

print("---")
--for key, value in ipairs(obj) do
--    print(key, value)
--end