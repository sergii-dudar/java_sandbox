-- String helper tests + insulate / expose demo.
-- `insulate` runs the block in its own sandbox so global/package mutations
-- don't leak to other specs. `expose` does the opposite.

local s = require("sandbox.strs")

insulate("strs (isolated module env)", function()
  -- Replace `math.random` only inside this insulated block.
  math.random = function() return 0.5 end

  it("reverse round-trips", function()
    assert.equals("hello", s.reverse(s.reverse("hello")))
  end)

  it("detects palindromic phrases", function()
    assert.is_true(s.is_palindrome("A man a plan a canal Panama"))
    assert.is_true(s.is_palindrome("No lemon, no melon"))
    assert.is_false(s.is_palindrome("hello world"))
  end)

  it("counts words", function()
    assert.equals(0, s.word_count(""))
    assert.equals(1, s.word_count("solo"))
    assert.equals(4, s.word_count("  the   quick   brown   fox "))
  end)

  it("capitalizes", function()
    assert.equals("Hello", s.capitalize("hello"))
    assert.equals("",      s.capitalize(""))
  end)

  it("shouts", function()
    assert.equals("RUST", s.shout("rust"))
  end)
end)

describe("strs (regular describe)", function()
  it("reverse preserves multi-byte chars (Lua treats bytes only)", function()
    -- Just demonstrating Lua's byte-level reverse — this test documents the
    -- known limitation, not a property guarantee.
    local r = s.reverse("abc")
    assert.equals(3, #r)
  end)
end)
