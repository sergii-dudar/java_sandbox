// Variant: skipping/focusing tests + a typed custom matcher (expect.extend).

import { isEven } from "../src/calculator";

// Declaration merging: teach TypeScript about the custom matcher.
declare global {
  // eslint-disable-next-line @typescript-eslint/no-namespace
  namespace jest {
    interface Matchers<R> {
      toBeEven(): R;
    }
  }
}

expect.extend({
  toBeEven(received: number) {
    const pass = received % 2 === 0;
    return {
      pass,
      message: () => `expected ${received} ${pass ? "not " : ""}to be even`,
    };
  },
});

describe("skipping and custom matchers", () => {
  test.skip("skipped: not ready yet", () => {
    expect(true).toBe(false);
  });

  test.todo("write a test for negative numbers");

  test("custom toBeEven matcher passes", () => {
    expect(4).toBeEven();
    expect(7).not.toBeEven();
    expect(isEven(10)).toBe(true);
  });

  test("conditional skip at runtime", () => {
    if (process.platform === ("sunos" as NodeJS.Platform)) {
      return;
    }
    expect(isEven(2)).toBe(true);
  });
});
