// Variant: snapshot testing (inline and file-based).
// First run writes snapshots; later runs compare. Update with: jest -u

import * as calc from "../src/calculator";
import { sayHi } from "../src/strings";

describe("snapshots", () => {
  test("inline snapshot", () => {
    expect(sayHi("Alice")).toMatchInlineSnapshot(`"Hi, Alice!"`);
  });

  test("file snapshot of an object", () => {
    const report = {
      fizzbuzz: [1, 3, 5, 15].map((n) => calc.fizzbuzz(n)),
      greeting: sayHi("World"),
    };
    expect(report).toMatchSnapshot();
  });
});
