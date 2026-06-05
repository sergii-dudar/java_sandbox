// Variant: mocking — jest.fn(), jest.spyOn(), and typed jest.mock() of a module.

import { greetLoud } from "../src/strings";
import * as strings from "../src/strings";
import { getUserName } from "../src/userService";

// Mock the module; `jest.mocked` gives us full type-safety on the mock.
jest.mock("../src/strings", () => {
  const actual = jest.requireActual("../src/strings");
  return { ...actual, fetchUser: jest.fn() };
});

const mockedStrings = jest.mocked(strings);

describe("mocking", () => {
  afterEach(() => {
    jest.clearAllMocks();
  });

  test("jest.fn() records calls and controls return value", () => {
    const callback = jest.fn<string, [string, string]>().mockReturnValue("mocked");

    expect(callback("a", "b")).toBe("mocked");
    expect(callback).toHaveBeenCalledTimes(1);
    expect(callback).toHaveBeenCalledWith("a", "b");
  });

  test("mockReturnValueOnce / mockImplementation", () => {
    const fn = jest
      .fn<number, []>()
      .mockReturnValueOnce(1)
      .mockReturnValueOnce(2)
      .mockImplementation(() => 99);

    expect([fn(), fn(), fn()]).toEqual([1, 2, 99]);
  });

  test("mockResolvedValue / mockRejectedValue", async () => {
    const ok = jest.fn<Promise<string>, []>().mockResolvedValue("done");
    const bad = jest.fn().mockRejectedValue(new Error("boom"));

    await expect(ok()).resolves.toBe("done");
    await expect(bad()).rejects.toThrow("boom");
  });

  test("jest.spyOn() wraps a real method", () => {
    const spy = jest.spyOn(console, "log").mockImplementation(() => {});

    const result = greetLoud("Alice");

    expect(result).toBe("ALICE");
    expect(spy).toHaveBeenCalledWith("Hello, Alice!");
    spy.mockRestore();
  });

  test("typed module mock", async () => {
    mockedStrings.fetchUser.mockResolvedValue({ id: 1, name: "mocked-user" });

    await expect(getUserName(1)).resolves.toBe("mocked-user");
    expect(mockedStrings.fetchUser).toHaveBeenCalledWith(1);
  });
});
