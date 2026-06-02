-- Tiny numeric helpers exercised by the test suite.
local M = {}

function M.add(a, b) return a + b end
function M.sub(a, b) return a - b end
function M.mul(a, b) return a * b end

function M.div(a, b)
  if b == 0 then return nil, "division by zero" end
  return a / b
end

function M.factorial(n)
  if n < 0 then return nil, "negative" end
  local r = 1
  for i = 2, n do r = r * i end
  return r
end

function M.fibonacci(n)
  local a, b = 0, 1
  for _ = 1, n do a, b = b, a + b end
  return a
end

function M.is_prime(n)
  if n < 2 then return false end
  if n % 2 == 0 then return n == 2 end
  local i = 3
  while i * i <= n do
    if n % i == 0 then return false end
    i = i + 2
  end
  return true
end

function M.gcd(a, b)
  while b ~= 0 do a, b = b, a % b end
  return a
end

return M
