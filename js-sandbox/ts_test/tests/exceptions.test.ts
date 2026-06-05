// Variant: asserting thrown errors with toThrow.

import { BankAccount, divide } from "../src/calculator";

describe("exceptions", () => {
  test("throws on division by zero", () => {
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
