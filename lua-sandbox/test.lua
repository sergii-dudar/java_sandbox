#!/usr/bin/lua

--print(string.match(" TicketServiceApplication.java ", "TicketServiceApplication.java:?%d*"))
--print(string.match("sdfsdf (TicketServiceApplication.java:13) ", "[A-Za-z0-9_-]*%.?%w*:13"))

local function directory_exists(dir)
	local f = io.open(dir, "r")
	if f then
		f:close()
		return true
	end
	return false
end

-- Check for battery presence
local battery_present = directory_exists("/sys/class/power_supply/BAT0")

print(tostring(battery_present))

local function tableMerge(...)
	local result = {}
	for _, t in ipairs({ ... }) do
		for _, v in ipairs(t) do
			table.insert(result, v)
		end
	end
	return result
end

local concat_match_tables = function(...)
	local result = {}
	for _, t in ipairs({ ... }) do
		if t.is_match() then
			for _, v in ipairs(t.table) do
				table.insert(result, v)
			end
		end
	end
	return result
end

local result = concat_match_tables({
	is_match = function()
		return true
	end,
	table = { 1, 2, 3 },
}, {
	is_match = function()
		return true
	end,
	table = { 4, 5, 6 },
}, {
	is_match = function()
		return true
	end,
	table = { 7, 8, 9 },
})
print("sorted table: ", table.concat(result, ", "))
