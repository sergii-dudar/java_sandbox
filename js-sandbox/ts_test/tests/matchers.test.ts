// Variant: core matchers (equality, truthiness, numbers, strings, collections).

import { add, isEven } from "../src/calculator";

describe("matchers", () => {
  test("toBe vs toEqual", () => {
    expect(add(2, 3)).toBe(5);
    expect({ a: 1, b: 2 }).toEqual({ b: 2, a: 1 });
    expect({ a: 1, b: undefined }).not.toStrictEqual({ a: 1 });
  });

  test("truthiness", () => {
    expect(isEven(4)).toBe(true);
    expect(isEven(5)).toBe(false);
    expect(null).toBeNull();
    expect(undefined).toBeUndefined();
    expect("x").toBeDefined();
    expect(0).toBeFalsy();
    expect("hi").toBeTruthy();
  });

  test("numbers", () => {
    expect(add(2, 3)).toBeGreaterThan(4);
    expect(add(2, 3)).toBeGreaterThanOrEqual(5);
    expect(add(2, 3)).toBeLessThan(10);
    expect(0.1 + 0.2).toBeCloseTo(0.3);
  });

  test("strings", () => {
    expect("Hi, Alice!").toMatch(/^Hi, [A-Z][a-z]+!$/);
    expect("hello world").toContain("world");
  });

  test("arrays and objects", () => {
    expect([1, 2, 3]).toContain(2);
    expect([1, 2, 3]).toHaveLength(3);
    expect({ name: "jest", version: 30 }).toHaveProperty("name", "jest");
    expect([{ id: 1 }]).toEqual(expect.arrayContaining([{ id: 1 }]));
    expect({ a: 1, b: 2 }).toEqual(expect.objectContaining({ a: 1 }));
  });
});
