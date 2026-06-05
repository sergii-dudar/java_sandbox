// Variant: fake timers — control setTimeout/setInterval without waiting.

describe("fake timers", () => {
  beforeEach(() => {
    jest.useFakeTimers();
  });

  afterEach(() => {
    jest.useRealTimers();
  });

  test("advance time to trigger a timeout", () => {
    const callback = jest.fn();
    setTimeout(callback, 1000);

    expect(callback).not.toHaveBeenCalled();
    jest.advanceTimersByTime(1000);
    expect(callback).toHaveBeenCalledTimes(1);
  });

  test("run all pending timers", () => {
    const callback = jest.fn();
    setTimeout(callback, 5000);

    jest.runAllTimers();
    expect(callback).toHaveBeenCalledTimes(1);
  });

  test("intervals fire repeatedly", () => {
    const tick = jest.fn();
    setInterval(tick, 100);

    jest.advanceTimersByTime(350);
    expect(tick).toHaveBeenCalledTimes(3);
  });
});
