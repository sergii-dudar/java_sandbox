"use strict";

// Variant: parametrized tests with test.each (array and tagged-template forms).

const { fizzbuzz, isEven } = require("../src/calculator");

describe("parametrized", () => {
  // Array-of-arrays form; %i / %s interpolate into the test name.
  test.each([
    [2, true],
    [4, true],
    [0, true],
    [3, false],
  ])("isEven(%i) === %s", (input, expected) => {
    expect(isEven(input)).toBe(expected);
  });

  // Tagged-template-literal form with named columns.
  test.each`
    n     | expected
    ${1}  | ${"1"}
    ${3}  | ${"Fizz"}
    ${5}  | ${"Buzz"}
    ${15} | ${"FizzBuzz"}
  `("fizzbuzz($n) returns $expected", ({ n, expected }) => {
    expect(fizzbuzz(n)).toBe(expected);
  });

  // describe.each shares the same body across multiple parameter sets.
  describe.each([
    [1, 2, 3],
    [10, 20, 30],
  ])("add-like checks for (%i, %i)", (a, b, sum) => {
    test(`${a} + ${b} === ${sum}`, () => {
      expect(a + b).toBe(sum);
    });
  });
});
