-- Demonstrates Busted's pending / skip / async / `it` tags.
-- Pending tests show up as a distinct outcome (not pass, not fail).

describe("pending and skipped tests", function()
  pending("not implemented yet — placeholder")

  it("explicitly pending mid-test", function()
    pending("waiting on upstream fix")
    -- code below this line is not executed
    error("should not be reached")
  end)

  it("a passing test alongside pending", function()
    assert.equals(2, 1 + 1)
  end)

  it("tagged test #fast", function()
    -- Run only tagged tests with: `busted --tags=fast`
    assert.is_true(true)
  end)

  it("tagged test #slow", function()
    -- Exclude with: `busted --exclude-tags=slow`
    assert.equals(7, 3 + 4)
  end)
end)

describe("async tests", function()
  -- Busted's async/done() globals are only available when the runner is
  -- launched with `--coroutine-supplemental` / specific Lua VMs. The simple
  -- portable approach is to perform an immediate "async" check inside a
  -- coroutine and verify completion.
  it("supports cooperative async via coroutines", function()
    local co = coroutine.create(function() return 42 end)
    local ok, value = coroutine.resume(co)
    assert.is_true(ok)
    assert.equals(42, value)
  end)
end)

describe("strict mode demos", function()
  randomize() -- run the `it`s inside this describe in random order

  it("first (will run in random order)", function()
    assert.is_true(true)
  end)
  it("second (will run in random order)", function()
    assert.is_true(true)
  end)
  it("third (will run in random order)", function()
    assert.is_true(true)
  end)
end)
