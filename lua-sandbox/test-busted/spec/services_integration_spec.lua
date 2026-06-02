-- Integration-style test: exercises services + dependencies together
-- without mocking, using small in-memory fakes.

local services = require("sandbox.services")

local function in_memory_prices(prices)
  return setmetatable({ data = prices }, { __index = {
    price_of = function(self, sym) return self.data[sym] end,
  } })
end

local function recording_notifier()
  local n = { messages = {} }
  function n:notify(msg)
    table.insert(self.messages, msg)
    return true
  end
  return n
end

local function failing_notifier()
  return { notify = function() return nil, "offline" end }
end

describe("services.Portfolio integration", function()
  it("sums prices for the listed symbols", function()
    local provider = in_memory_prices({ AAPL = 180, MSFT = 420, GOOG = 140 })
    local notifier = recording_notifier()
    local p = services.new(provider, notifier)

    local total, err = p:total({ "AAPL", "MSFT", "GOOG" })
    assert.is_nil(err)
    assert.equals(740, total)
    assert.same({ "total=740" }, notifier.messages)
  end)

  it("treats missing symbols as zero contribution", function()
    local provider = in_memory_prices({ AAPL = 100 })
    local notifier = recording_notifier()
    local p = services.new(provider, notifier)

    assert.equals(100, p:total({ "AAPL", "FOO", "BAR" }))
  end)

  it("propagates notifier failures", function()
    local provider = in_memory_prices({ AAPL = 1 })
    local p = services.new(provider, failing_notifier())

    local total, err = p:total({ "AAPL" })
    assert.is_nil(total)
    assert.equals("offline", err)
  end)

  it("accepts a function-style provider", function()
    local notifier = recording_notifier()
    local provider = function(sym)
      if sym == "X" then return 50 end
      return nil
    end
    local p = services.new(provider, notifier)

    assert.equals(50, p:total({ "X", "Y" }))
  end)
end)
