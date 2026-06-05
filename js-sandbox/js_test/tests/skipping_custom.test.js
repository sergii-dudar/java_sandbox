"use strict";

// Variant: skipping and focusing tests, plus custom matchers (expect.extend).

const { isEven } = require("../src/calculator");

// Register a domain-specific matcher available to the tests below.
expect.extend({
  toBeEven(received) {
    const pass = received % 2 === 0;
    return {
      pass,
      message: () =>
        `expected ${received} ${pass ? "not " : ""}to be even`,
    };
  },
});

describe("skipping and custom matchers", () => {
  test.skip("skipped: not ready yet", () => {
    expect(true).toBe(false); // never executed
  });

  test.todo("write a test for negative numbers");

  // test.only would focus a single test; shown here as a comment to avoid
  // accidentally skipping the rest of the file:
  // test.only("focused", () => { ... });

  test("custom toBeEven matcher passes", () => {
    expect(4).toBeEven();
    expect(7).not.toBeEven();
    expect(isEven(10)).toBe(true);
  });

  test("conditional skip at runtime", () => {
    if (process.platform === "sunos") {
      return; // bail out early on an unsupported platform
    }
    expect(isEven(2)).toBe(true);
  });
});
