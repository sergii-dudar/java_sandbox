-- String helpers.
local M = {}

function M.reverse(s) return s:reverse() end

function M.is_palindrome(s)
  local cleaned = s:lower():gsub("[^%w]", "")
  return cleaned == cleaned:reverse()
end

function M.word_count(s)
  local n = 0
  for _ in s:gmatch("%S+") do n = n + 1 end
  return n
end

function M.capitalize(s)
  if s == "" then return s end
  return s:sub(1, 1):upper() .. s:sub(2)
end

function M.shout(s) return s:upper() end

return M
