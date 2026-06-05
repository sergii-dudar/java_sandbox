"use strict";

// Variant: asynchronous tests (promises, async/await, resolves/rejects, done).

const { delay, fetchUser, loadConfig } = require("../src/strings");

describe("async", () => {
  test("async/await", async () => {
    const value = await delay("ready", 5);
    expect(value).toBe("ready");
  });

  test("returning a promise", () => {
    return delay(42, 5).then((value) => {
      expect(value).toBe(42);
    });
  });

  test("resolves matcher", async () => {
    await expect(delay("ok", 5)).resolves.toBe("ok");
  });

  test("rejects matcher", async () => {
    await expect(fetchUser(0)).rejects.toThrow("id is required");
  });

  test("resolved object", async () => {
    await expect(fetchUser(7)).resolves.toEqual({ id: 7, name: "user-7" });
  });

  // Callback-style API: call done() when finished, or done(err) to fail.
  test("callback with done", (done) => {
    loadConfig((err, config) => {
      try {
        expect(err).toBeNull();
        expect(config.mode).toBe("production");
        done();
      } catch (e) {
        done(e);
      }
    });
  });
});
