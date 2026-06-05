"use strict";

// Variant: snapshot testing (inline and file-based).
// First run writes snapshots; later runs compare. Update with: jest -u

const calc = require("../src/calculator");
const strings = require("../src/strings");

describe("snapshots", () => {
  test("inline snapshot", () => {
    expect(strings.sayHi("Alice")).toMatchInlineSnapshot(`"Hi, Alice!"`);
  });

  test("file snapshot of an object", () => {
    const report = {
      fizzbuzz: [1, 3, 5, 15].map((n) => calc.fizzbuzz(n)),
      greeting: strings.sayHi("World"),
    };
    expect(report).toMatchSnapshot();
  });
});
