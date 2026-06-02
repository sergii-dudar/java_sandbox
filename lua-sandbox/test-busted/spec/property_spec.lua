-- Repeatable randomized property-style tests. Busted has no built-in
-- shrinker, so we keep things simple: generate many random cases and
-- check invariants. Failures print the failing input.

local m = require("sandbox.math")
local s = require("sandbox.strs")

local function rand_int(lo, hi) return math.random(lo, hi) end
local function rand_string(maxlen)
  local n = math.random(0, maxlen)
  local t = {}
  for i = 1, n do t[i] = string.char(math.random(32, 126)) end
  return table.concat(t)
end

describe("property: add is commutative", function()
  for i = 1, 50 do
    it("case #" .. i, function()
      local a = rand_int(-10000, 10000)
      local b = rand_int(-10000, 10000)
      assert.are.equal(m.add(a, b), m.add(b, a),
        ("commutativity failed for (%d,%d)"):format(a, b))
    end)
  end
end)

describe("property: gcd divides both operands", function()
  for i = 1, 50 do
    it("case #" .. i, function()
      local a = rand_int(1, 10000)
      local b = rand_int(1, 10000)
      local g = m.gcd(a, b)
      assert.is_true(g >= 1)
      assert.equals(0, a % g)
      assert.equals(0, b % g)
    end)
  end
end)

describe("property: reverse twice is identity", function()
  for i = 1, 50 do
    it("case #" .. i, function()
      local input = rand_string(40)
      assert.equals(input, s.reverse(s.reverse(input)),
        "input was: " .. input)
    end)
  end
end)
