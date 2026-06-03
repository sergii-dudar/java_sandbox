# unittest examples — all variants

A self-contained collection of [`unittest`](https://docs.python.org/3/library/unittest.html)
tests that demonstrate every major feature ("variant") of Python's built-in
testing framework. It mirrors the `pytest-tests` and `bashunit-tests` suites.

No third-party packages are needed — `unittest` and `unittest.mock` ship with
the standard library, so **there is no venv to create**.

## Layout

```
unittest-tests/
├── src/                       # "system under test"
│   ├── calculator.py          # add / divide / is_even / fizzbuzz / BankAccount
│   └── strings.py             # say_hi / slugify / greet_loud / fetch_config / legacy_double / do_work
└── tests/
    ├── __init__.py               # adds ../src to sys.path for all test modules
    ├── test_assertions.py        # assertEqual/True/In/AlmostEqual/Regex/Dict/Count...
    ├── test_exceptions.py        # assertRaises / assertRaisesRegex (callable + context manager)
    ├── test_lifecycle.py         # setUpModule/Class + setUp/tearDown + addCleanup
    ├── test_subtests.py          # subTest() parametrization + dynamically generated methods
    ├── test_skipping.py          # skip / skipIf / skipUnless / skipTest / expectedFailure
    ├── test_mocking.py           # unittest.mock: Mock / patch / patch.dict / MagicMock / side_effect
    ├── test_warnings_logs_output.py # assertWarns / assertLogs / redirect_stdout / TemporaryDirectory
    └── test_custom_asserts.py    # reusable custom assertions + addTypeEqualityFunc
```

## Running

Run discovery from the project root so the `tests` package (and its
`__init__.py` path bootstrap) is imported correctly:

```bash
cd unittest-tests

# discover & run everything (verbose)
python3 -m unittest discover -s tests -t . -v

# quieter
python3 -m unittest discover -s tests -t .

# a single module / class / method
python3 -m unittest tests.test_mocking
python3 -m unittest tests.test_lifecycle.TestLifecycle
python3 -m unittest tests.test_skipping.TestSkipping.test_known_bug
```

> The `tests/__init__.py` file puts `src/` on `sys.path`, so the modules import
> as `calculator` / `strings`. Using `-t .` (top-level dir = project root) is what
> makes that package `__init__` run during discovery.

## Expected result

The *intentional* non-passes are part of the demo:

```
Ran 41 tests ... OK (skipped=2, expected failures=1)
```

- `skipped` — `test_always_skipped` + the fully-skipped `TestEntireClassSkipped`
- `expected failures` — `test_known_bug` (`@unittest.expectedFailure`)

(`skipUnless`/`skip_imperatively` also skip if you are **not** on Linux.)
