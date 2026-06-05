# Jest examples (TypeScript) — all variants

A self-contained [Jest](https://jestjs.io) + [ts-jest](https://kulshekhar.github.io/ts-jest/)
project demonstrating every major testing "variant" in TypeScript. It mirrors
the `js_test` suite, adding TypeScript-specific touches (typed mocks,
declaration-merged custom matchers, a `typecheck` script).

## Layout

```
ts_test/
├── package.json               # jest + ts-jest + typescript dev-deps + scripts
├── tsconfig.json              # strict TS config (types: jest, node)
├── jest.config.js             # ts-jest preset
├── src/                       # typed "system under test"
│   ├── calculator.ts          # add / divide / isEven / fizzbuzz / BankAccount
│   ├── strings.ts             # sayHi / slugify / greetLoud / delay / fetchUser / loadConfig
│   └── userService.ts         # depends on strings (used for module mocking)
└── tests/
    ├── matchers.test.ts          # toBe/toEqual/toMatch/toContain/toHaveProperty...
    ├── exceptions.test.ts        # toThrow (message / class / regex)
    ├── parametrized.test.ts      # test.each (typed array + template) + describe.each
    ├── lifecycle.test.ts         # beforeAll/afterAll/beforeEach/afterEach + nesting
    ├── async.test.ts             # async/await, promises, resolves/rejects, done()
    ├── mocking.test.ts           # jest.fn / spyOn / jest.mocked typed module mock
    ├── timers.test.ts            # fake timers
    ├── snapshot.test.ts          # toMatchSnapshot + toMatchInlineSnapshot
    └── skipping_custom.test.ts   # test.skip/.todo + typed expect.extend matcher
```

## Variants covered

| Area | Jest feature | Where |
|------|--------------|-------|
| Core matchers | `toBe`, `toEqual`, `toStrictEqual`, `toBeCloseTo`, `toContain`, `toHaveProperty`, `expect.objectContaining` | `matchers.test.ts` |
| Exceptions | `toThrow` (string / class / regex) | `exceptions.test.ts` |
| Parametrized | typed `test.each`, `describe.each` | `parametrized.test.ts` |
| Lifecycle | `beforeAll` / `afterAll` / `beforeEach` / `afterEach` | `lifecycle.test.ts` |
| Async | `async/await`, `.resolves` / `.rejects`, `done` | `async.test.ts` |
| Mocking | `jest.fn`, `jest.spyOn`, `jest.mocked` (typed module mock) | `mocking.test.ts` |
| Fake timers | `jest.useFakeTimers`, `advanceTimersByTime` | `timers.test.ts` |
| Snapshots | `toMatchSnapshot`, `toMatchInlineSnapshot` | `snapshot.test.ts` |
| Skip / todo / custom matchers | `test.skip`, `test.todo`, declaration-merged `expect.extend` | `skipping_custom.test.ts` |

## Setup

```bash
cd ts_test
npm install
```

## Running

```bash
npm test                 # run everything (ts-jest compiles on the fly)
npm run test:verbose     # show every test name
npm run test:coverage    # coverage report
npm run typecheck        # tsc --noEmit (type-only check, no tests run)

# raw jest
npx jest matchers              # filter by filename substring
npx jest -t "throws"           # filter by test-name substring
npx jest -u                    # update snapshots
```

## Expected result

```
Tests: 1 skipped, 1 todo, 40 passed, 42 total
```

The `skipped`/`todo` entries are intentional (`test.skip`, `test.todo`).

## TypeScript notes

- `tests/skipping_custom.test.ts` uses **declaration merging** (`namespace jest`)
  so the custom `toBeEven()` matcher is type-checked.
- `tests/mocking.test.ts` uses `jest.mocked(...)` to get a fully-typed mock of a
  module, so `mockResolvedValue` and call assertions are type-safe.
