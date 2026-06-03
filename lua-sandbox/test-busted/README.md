# Lua testing examples — all variants (Busted)

A self-contained [Busted](https://lunarmodules.github.io/busted/) test suite
demonstrating the major Lua testing "variants": BDD-style specs, rich
assertions, parametrized/table-driven tests, mocks & spies, async, pending/skip,
property-style tests, tags, multiple output formats and coverage.

It is the Lua counterpart to the `pytest-tests`, `unittest-tests` and
`bashunit-tests` suites elsewhere in this repo.

## Layout

```
lua-sandbox/test-busted/
├── .busted                    # Busted config: lpath, helper, output profiles
├── Makefile                   # ~30 `make` targets (run `make help`)
├── src/sandbox/               # "system under test"
│   ├── math.lua
│   ├── strs.lua
│   └── services.lua
└── spec/
    ├── helper.lua             # loaded before specs (shared setup)
    ├── main.lua
    ├── math_spec.lua              # describe/it + before_each/after_each
    ├── assertions_spec.lua        # luassert: equals, same, truthy, error, matches...
    ├── math_parametrized_spec.lua # table-driven / generated test cases
    ├── strs_spec.lua
    ├── mocks_spec.lua             # mock() / spy() / stub()
    ├── pending_async_spec.lua     # pending(), skip, async/done callbacks
    ├── property_spec.lua          # randomized property-style tests
    └── services_integration_spec.lua # wiring modules together
```

## Variants covered

| Area | Busted feature | Where |
|------|----------------|-------|
| BDD structure | `describe` / `it` / nested contexts | every spec |
| Lifecycle | `before_each` / `after_each` / `setup` / `teardown` | `math_spec.lua` |
| Assertions | `assert.equals`, `assert.same`, `assert.is_true`, `assert.has_error`, `assert.matches` | `assertions_spec.lua` |
| Parametrized | generated `it` blocks from a table | `math_parametrized_spec.lua` |
| Mocks/spies/stubs | `mock()`, `spy.on()`, `stub()` | `mocks_spec.lua` |
| Pending / skip | `pending()` | `pending_async_spec.lua` |
| Async | `async()` / `done` callbacks | `pending_async_spec.lua` |
| Property-style | randomized inputs | `property_spec.lua` |
| Integration | multiple modules together | `services_integration_spec.lua` |
| Tags | `#fast` / `#slow` + `--tags` / `--exclude-tags` | `make test-tag-*` |
| Output formats | utfTerminal / plain / TAP / JSON / JUnit / gtest | `.busted` + `make test-*` |
| Coverage | luacov via `--coverage` | `make test-coverage` |

## Setup

Busted is installed with LuaRocks:

```bash
cd lua-sandbox/test-busted
make install          # luarocks --local install busted luacov
```

## Running

```bash
make help             # list every target with a description

make test             # run all specs (default pretty output)
make test-verbose     # show every test name

# single specs / filters
make test-math        # only spec/math_spec.lua
make test-filter      # --filter='palindrome'
make test-tag-fast    # --tags=fast
make test-tag-not-slow # --exclude-tags=slow

# output formats
make test-tap         # TAP
make test-json        # JSON
make test-junit       # JUnit XML -> test-results.xml

# diagnostics
make test-list        # list tests without running
make test-shuffle     # randomise order
make test-coverage    # luacov coverage
```

Or call Busted directly from this directory: `busted`, `busted spec/math_spec.lua`,
`busted --filter='palindrome'`, `busted --tags=fast`.
