-- Shared test helper, loaded automatically via the `helper` option in .busted.
-- A common place for global require shortcuts, custom assertions, etc.

-- Make `require("sandbox.math")` resolve even when busted is launched from
-- arbitrary working directories.
package.path = "./src/?.lua;./src/?/init.lua;" .. package.path

local say     = require("say")
local luassert = require("luassert")

-- Custom assertion: assert.is_even(n)
local function is_even(_, args)
  local n = args[1]
  return type(n) == "number" and n % 2 == 0
end

say:set("assertion.is_even.positive", "Expected %s to be even")
say:set("assertion.is_even.negative", "Expected %s NOT to be even")
luassert:register("assertion", "is_even", is_even,
  "assertion.is_even.positive", "assertion.is_even.negative")
