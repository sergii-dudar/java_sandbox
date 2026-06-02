-- Service-style module with an injectable dependency (used for mocking/stubbing).
local M = {}

-- Build a portfolio that depends on a `price_provider` (function or table with
-- `:price_of(symbol)`) and a `notifier` (table with `:notify(message)`).
function M.new(price_provider, notifier)
  local self = { provider = price_provider, notifier = notifier }

  function self:price_of(symbol)
    if type(self.provider) == "function" then return self.provider(symbol) end
    return self.provider:price_of(symbol)
  end

  function self:total(symbols)
    local sum = 0
    for _, s in ipairs(symbols) do
      local p = self:price_of(s)
      if p then sum = sum + p end
    end
    local ok, err = self.notifier:notify("total=" .. tostring(sum))
    if not ok then return nil, err end
    return sum
  end

  return self
end

return M
