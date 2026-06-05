# Jest examples (JavaScript) — all variants

A self-contained [Jest](https://jestjs.io) project demonstrating every major
testing "variant" in plain JavaScript (CommonJS). It is the JS counterpart to
the `ts_test`, `pytest-tests`, `unittest-tests` and `bashunit-tests` suites
elsewhere in this repo.

## Layout

```
js_test/
├── package.json               # jest dev-dep + scripts + jest config
├── src/                       # "system under test"
│   ├── calculator.js          # add / divide / isEven / fizzbuzz / BankAccount
│   ├── strings.js             # sayHi / slugify / greetLoud / delay / fetchUser / loadConfig
│   └── userService.js         # depends on strings (used for module mocking)
└── tests/
    ├── matchers.test.js          # toBe/toEqual/toMatch/toContain/toHaveProperty...
    ├── exceptions.test.js        # toThrow (message / class / regex)
    ├── parametrized.test.js      # test.each (array + template) + describe.each
    ├── lifecycle.test.js         # beforeAll/afterAll/beforeEach/afterEach + nesting
    ├── async.test.js             # async/await, promises, resolves/rejects, done()
    ├── mocking.test.js           # jest.fn / spyOn / jest.mock / mockResolvedValue
    ├── timers.test.js            # fake timers (advanceTimersByTime / runAllTimers)
    ├── snapshot.test.js          # toMatchSnapshot + toMatchInlineSnapshot
    └── skipping_custom.test.js   # test.skip/.todo + expect.extend custom matcher
```

## Variants covered

| Area | Jest feature | Where |
|------|--------------|-------|
| Core matchers | `toBe`, `toEqual`, `toStrictEqual`, `toBeCloseTo`, `toContain`, `toHaveProperty`, `expect.objectContaining` | `matchers.test.js` |
| Exceptions | `toThrow` (string / class / regex) | `exceptions.test.js` |
| Parametrized | `test.each`, `describe.each` | `parametrized.test.js` |
| Lifecycle | `beforeAll` / `afterAll` / `beforeEach` / `afterEach` | `lifecycle.test.js` |
| Async | `async/await`, returned promise, `.resolves` / `.rejects`, `done` | `async.test.js` |
| Mocking | `jest.fn`, `jest.spyOn`, `jest.mock`, `mockResolvedValue` | `mocking.test.js` |
| Fake timers | `jest.useFakeTimers`, `advanceTimersByTime` | `timers.test.js` |
| Snapshots | `toMatchSnapshot`, `toMatchInlineSnapshot` | `snapshot.test.js` |
| Skip / todo / custom matchers | `test.skip`, `test.todo`, `expect.extend` | `skipping_custom.test.js` |

## Setup

```bash
cd js_test
npm install
```

## Running

```bash
npm test                 # run everything
npm run test:verbose     # show every test name
npm run test:coverage    # coverage report (text + coverage/)

# raw jest
npx jest                       # all tests
npx jest matchers              # filter by filename substring
npx jest -t "throws"           # filter by test-name substring
npx jest --watch               # watch mode
npx jest -u                    # update snapshots
```

## Expected result

```
Tests: 1 skipped, 1 todo, 40 passed, 42 total
```

The `skipped`/`todo` entries are intentional (`test.skip`, `test.todo`).
