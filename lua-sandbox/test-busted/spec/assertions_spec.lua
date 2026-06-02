-- Exercises the full breadth of Busted's `assert` (luassert) library.

local s = require("sandbox.strs")
local m = require("sandbox.math")

describe("assertions catalog", function()
  it("equality and identity", function()
    assert.equals("hello", "hello")
    assert.are.equal(1, 1)
    assert.are.same({ 1, 2, 3 }, { 1, 2, 3 })   -- deep equality
    assert.are_not.equal({}, {})                 -- different tables (identity)
  end)

  it("truthiness", function()
    assert.is_true(true)
    assert.is_false(false)
    assert.is_truthy("anything not nil or false")
    assert.is_falsy(nil)
    assert.is_falsy(false)
  end)

  it("nil / not_nil", function()
    assert.is_nil(nil)
    assert.is_not_nil(0)
  end)

  it("types", function()
    assert.is_string("x")
    assert.is_number(1)
    assert.is_boolean(true)
    assert.is_table({})
    assert.is_function(print)
    assert.is_nil(nil)
  end)

  it("matches and string predicates", function()
    assert.matches("^hello", "hello world")
    assert.matches("%d+", "abc123")
    assert.is_not.matches("^foo", "bar")
  end)

  it("numeric comparisons via near", function()
    assert.is.near(3.14, 3.141, 0.01)
    assert.is_not.near(1.0, 2.0, 0.1)
  end)

  it("error throwing", function()
    assert.has_error(function() error("boom") end)
    assert.has_error(function() error("boom!") end, "boom!")
    assert.has_no.errors(function() return 1 + 1 end)
    assert.error_matches(function() error("xyz: 42") end, ":%s*%d+$")
  end)

  it("library results are well-formed", function()
    assert.equals("olleh", s.reverse("hello"))
    assert.is_true(s.is_palindrome("racecar"))
    assert.equals(120, m.factorial(5))
  end)
end)
