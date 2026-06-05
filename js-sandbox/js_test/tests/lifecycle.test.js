"use strict";

// Variant: lifecycle hooks (beforeAll / afterAll / beforeEach / afterEach)
// and nested describe scoping.

const { BankAccount } = require("../src/calculator");

const events = [];

describe("lifecycle", () => {
  let account;

  beforeAll(() => {
    events.push("beforeAll");
  });

  afterAll(() => {
    events.push("afterAll");
  });

  beforeEach(() => {
    account = new BankAccount(100);
    events.push("beforeEach");
  });

  afterEach(() => {
    account = null;
    events.push("afterEach");
  });

  test("beforeEach provided a fresh account", () => {
    expect(account.balance).toBe(100);
    account.deposit(50);
    expect(account.balance).toBe(150);
  });

  test("the next test starts fresh again", () => {
    expect(account.balance).toBe(100);
  });

  describe("nested scope", () => {
    let nestedFlag;

    beforeEach(() => {
      nestedFlag = "nested-setup";
    });

    test("inner beforeEach runs in addition to the outer one", () => {
      expect(nestedFlag).toBe("nested-setup");
      expect(account.balance).toBe(100); // outer beforeEach still applied
    });
  });

  test("hooks fired in the expected order", () => {
    expect(events[0]).toBe("beforeAll");
    expect(events).toContain("beforeEach");
    expect(events).toContain("afterEach");
  });
});
