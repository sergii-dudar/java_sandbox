"use strict";

// Variant: asserting thrown errors with toThrow.

const { BankAccount, divide } = require("../src/calculator");

describe("exceptions", () => {
  test("throws on division by zero", () => {
    // The function call must be wrapped so Jest can catch the throw.
    expect(() => divide(10, 0)).toThrow();
    expect(() => divide(10, 0)).toThrow(Error);
    expect(() => divide(10, 0)).toThrow("division by zero");
    expect(() => divide(10, 0)).toThrow(/division/);
  });

  test("throws on overdraw", () => {
    const account = new BankAccount(10);
    expect(() => account.withdraw(50)).toThrow("insufficient funds");
  });

  test("does not throw on the happy path", () => {
    const account = new BankAccount(20);
    expect(() => account.withdraw(5)).not.toThrow();
    expect(account.balance).toBe(15);
  });
});
