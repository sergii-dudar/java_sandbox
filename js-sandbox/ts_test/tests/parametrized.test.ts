// Variant: parametrized tests with test.each (array and tagged-template forms).

import { fizzbuzz, isEven } from "../src/calculator";

describe("parametrized", () => {
  test.each<[number, boolean]>([
    [2, true],
    [4, true],
    [0, true],
    [3, false],
  ])("isEven(%i) === %s", (input, expected) => {
    expect(isEven(input)).toBe(expected);
  });

  test.each`
    n     | expected
    ${1}  | ${"1"}
    ${3}  | ${"Fizz"}
    ${5}  | ${"Buzz"}
    ${15} | ${"FizzBuzz"}
  `(
    "fizzbuzz($n) returns $expected",
    ({ n, expected }: { n: number; expected: string }) => {
      expect(fizzbuzz(n)).toBe(expected);
    },
  );

  describe.each<[number, number, number]>([
    [1, 2, 3],
    [10, 20, 30],
  ])("add-like checks for (%i, %i)", (a, b, sum) => {
    test(`${a} + ${b} === ${sum}`, () => {
      expect(a + b).toBe(sum);
    });
  });
});
