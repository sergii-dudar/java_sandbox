-- Basic Busted spec: describe/it, before_each/after_each, and the
-- canonical assert library.

local m = require("sandbox.math")

describe("math (basics)", function()
  local helper_value

  setup(function()
    -- Runs ONCE before any test in this describe block.
    helper_value = 42
  end)

  teardown(function()
    -- Runs ONCE after all tests in this describe block.
    helper_value = nil
  end)

  before_each(function()
    -- Runs before EVERY test (it).
  end)

  after_each(function()
    -- Runs after EVERY test.
  end)

  it("adds two numbers", function()
    assert.are.equal(5, m.add(2, 3))
  end)

  it("subtracts", function()
    assert.are.equal(6, m.sub(10, 4))
  end)

  it("multiplies", function()
    assert.equals(42, m.mul(6, 7))
  end)

  it("divides without error", function()
    local q, err = m.div(20, 4)
    assert.is_nil(err)
    assert.are.equal(5, q)
  end)

  it("returns an error on division by zero", function()
    local q, err = m.div(1, 0)
    assert.is_nil(q)
    assert.are.equal("division by zero", err)
  end)

  it("uses the setup-provided value", function()
    assert.is_truthy(helper_value)
  end)

  it("supports custom assertions from helper.lua", function()
    assert.is_even(10)
    assert.is_not.is_even(7)
  end)
end)

describe("math (nested describes)", function()
  describe("factorial", function()
    it("0! is 1",  function() assert.equals(1,   m.factorial(0))  end)
    it("5! is 120", function() assert.equals(120, m.factorial(5)) end)
  end)

  describe("fibonacci", function()
    it("starts at 0", function() assert.equals(0, m.fibonacci(0)) end)
    it("F(10) is 55", function() assert.equals(55, m.fibonacci(10)) end)
  end)
end)
