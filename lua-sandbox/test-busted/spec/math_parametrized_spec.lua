-- Parametrized / data-driven tests using a loop that generates one `it` per case.
-- Busted's failure output names each generated test so a parser can identify them.

local m = require("sandbox.math")

describe("add (table-driven)", function()
  local cases = {
    { name = "positives",    a = 2,  b = 3,   want = 5 },
    { name = "negatives",    a = -1, b = -2,  want = -3 },
    { name = "zeroes",       a = 0,  b = 0,   want = 0 },
    { name = "mixed_signs",  a = -5, b = 10,  want = 5 },
    { name = "large",        a = 1000000, b = 250000, want = 1250000 },
  }

  for _, tc in ipairs(cases) do
    it("add[" .. tc.name .. "]", function()
      assert.equals(tc.want, m.add(tc.a, tc.b))
    end)
  end
end)

describe("factorial (table-driven)", function()
  for _, tc in ipairs({
    { 0, 1 }, { 1, 1 }, { 5, 120 }, { 10, 3628800 },
  }) do
    local n, want = tc[1], tc[2]
    it(("factorial(%d) == %d"):format(n, want), function()
      assert.equals(want, m.factorial(n))
    end)
  end
end)

describe("is_prime (table-driven)", function()
  local primes     = { 2, 3, 5, 7, 11, 13, 17, 19, 97, 7919 }
  local composites = { 0, 1, 4, 9, 15, 100, 7920 }

  for _, n in ipairs(primes) do
    it(("is_prime(%d) is true"):format(n), function()
      assert.is_true(m.is_prime(n))
    end)
  end
  for _, n in ipairs(composites) do
    it(("is_prime(%d) is false"):format(n), function()
      assert.is_false(m.is_prime(n))
    end)
  end
end)

describe("gcd (table-driven via map)", function()
  local cases = {
    ["54 and 24"] = { 54, 24, 6 },
    ["17 and 5"]  = { 17, 5,  1 },
    ["100 and 75"]= { 100, 75, 25 },
  }
  for name, tc in pairs(cases) do
    it("gcd of " .. name, function()
      assert.equals(tc[3], m.gcd(tc[1], tc[2]))
    end)
  end
end)
