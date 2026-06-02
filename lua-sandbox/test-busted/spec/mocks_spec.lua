-- Spies, stubs, and mocks (luassert.spy / luassert.stub / luassert.mock).
--   spy   — wraps a real function and records calls
--   stub  — replaces a function on a table; record calls AND control return
--   mock  — auto-stubs every function on a table

local services = require("sandbox.services")
local match    = require("luassert.match")

describe("spies", function()
  it("records calls to a wrapped function", function()
    local original = function(x) return x * 2 end
    local s = spy.new(original)

    assert.equals(8, s(4))
    assert.equals(20, s(10))

    assert.spy(s).was_called(2)
    assert.spy(s).was_called_with(4)
    assert.spy(s).was_called_with(10)
    assert.spy(s).was_not_called_with(99)
  end)

  it("can spy on a table method without changing behaviour", function()
    local t = { greet = function(self, who) return "hi, " .. who end }
    spy.on(t, "greet")

    local out = t:greet("ada")
    assert.equals("hi, ada", out)
    assert.spy(t.greet).was_called_with(match.is_table(), "ada")
  end)
end)

describe("stubs", function()
  it("replaces a function and controls its return value", function()
    local t = { compute = function() return "real" end }
    stub(t, "compute").returns("stubbed")

    assert.equals("stubbed", t.compute())
    assert.stub(t.compute).was_called(1)

    t.compute:revert()
    assert.equals("real", t.compute())
  end)

  it("can throw a controlled error", function()
    local t = { boom = function() return "ok" end }
    stub(t, "boom").invokes(function() error("kaboom") end)

    assert.has_error(function() t.boom() end, "kaboom")
  end)
end)

describe("mocks (auto-stub every function)", function()
  it("intercepts every method on a table", function()
    local notifier = { notify = function() return true end }
    local provider = { price_of = function() return 1 end }

    local mn = mock(notifier, true)  -- second arg = stub everything
    local mp = mock(provider, true)

    mp.price_of.returns(100)
    mn.notify.returns(true)

    local portfolio = services.new(provider, notifier)
    local total, err = portfolio:total({ "AAPL", "MSFT" })

    assert.is_nil(err)
    assert.equals(200, total)
    assert.spy(mp.price_of).was_called(2)
    assert.spy(mn.notify).was_called_with(match.is_table(), "total=200")

    mock.revert(notifier)
    mock.revert(provider)
  end)
end)

describe("matcher library", function()
  it("uses match.is_string / match.is_number / match.is_truthy etc.", function()
    local s = spy.new(function() end)
    s("hello", 42, true, { 1 })
    assert.spy(s).was_called_with(
      match.is_string(),
      match.is_number(),
      match.is_truthy(),
      match.is_table()
    )
  end)
end)
