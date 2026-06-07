"use strict";

// Variant: mocking — jest.fn(), jest.spyOn(), and jest.mock() of a module.

const { greetLoud } = require("../src/strings");

// Auto-mock the whole module, then control its exported function per test.
jest.mock("../src/strings", () => {
    const actual = jest.requireActual("../src/strings");
    return {
        ...actual,
        fetchUser: jest.fn(),
    };
});

const strings = require("../src/strings");
const { getUserName } = require("../src/userService");

describe("mocking", () => {
    afterEach(() => {
        jest.clearAllMocks();
    });

    test("jest.fn() records calls and controls return value", () => {
        const callback = jest.fn().mockReturnValue("mocked");

        expect(callback("a", "b")).toBe("mocked");
        expect(callback).toHaveBeenCalled();
        expect(callback).toHaveBeenCalledTimes(1);
        expect(callback).toHaveBeenCalledWith("a", "b");
    });

    test("mockReturnValueOnce / mockImplementation", () => {
        const fn = jest
            .fn()
            .mockReturnValueOnce(1)
            .mockReturnValueOnce(2)
            .mockImplementation(() => 99);

        expect([fn(), fn(), fn()]).toEqual([1, 2, 99]);
    });

    test("mockResolvedValue / mockRejectedValue", async () => {
        const ok = jest.fn().mockResolvedValue("done");
        const bad = jest.fn().mockRejectedValue(new Error("boom"));

        await expect(ok()).resolves.toBe("done");
        await expect(bad()).rejects.toThrow("boom");
    });

    test("jest.spyOn() wraps a real method", () => {
        const spy = jest.spyOn(console, "log").mockImplementation(() => { });

        const result = greetLoud("Alice");

        expect(result).toBe("ALICE");
        expect(spy).toHaveBeenCalledWith("Hello, Alice!");
        spy.mockRestore();
    });

    test("jest.mock() replaces a module dependency", async () => {
        strings.fetchUser.mockResolvedValue({ id: 1, name: "mocked-user" });

        await expect(getUserName(1)).resolves.toBe("mocked-user");
        expect(strings.fetchUser).toHaveBeenCalledWith(1);
    });
});
