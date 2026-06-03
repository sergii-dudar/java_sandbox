# pytest examples — all variants

A self-contained collection of [pytest](https://docs.pytest.org) tests that
demonstrate every major feature ("variant") of the framework. It mirrors the
`bashunit-tests` suite in the shell-sandbox.

## Layout

```
pytest-tests/
├── pytest.ini                 # config: pythonpath, addopts, markers, testpaths
├── conftest.py                # shared fixtures (account, session_marker, numbers)
├── requirements.txt
├── src/                       # "system under test"
│   ├── calculator.py          # add / divide / is_even / fizzbuzz / BankAccount
│   └── strings.py             # say_hi / slugify / greet_loud / fetch_config / legacy_double
└── tests/
    ├── test_assertions.py        # plain asserts + pytest.approx
    ├── test_exceptions.py        # pytest.raises (basic / match / inspect)
    ├── test_parametrize.py       # parametrize: single, multi, ids, stacked, pytest.param
    ├── test_fixtures.py          # local/conftest/yield/autouse/params/composition
    ├── test_markers.py           # skip / skipif / xfail / xpass / imperative skip / custom marker
    ├── test_builtin_fixtures.py  # tmp_path / monkeypatch / capsys / caplog / pytest.warns
    ├── test_mocking.py           # unittest.mock: Mock / patch / MagicMock / side_effect
    └── test_classes.py           # class-based tests + setup_method/teardown_method
```

## Setup

```bash
cd pytest-tests
python3 -m venv .venv
.venv/bin/python -m pip install -r requirements.txt
```

## Activating the venv

Activating lets you call `pytest` directly (no `.venv/bin/` prefix):

```bash
source .venv/bin/activate        # bash / zsh
source .venv/bin/activate.fish   # fish
# .venv\Scripts\activate         # Windows (PowerShell/cmd)
```

Your prompt shows `(.venv)` once active. Then just run `pytest`.
Leave the environment with:

```bash
deactivate
```

## Running

> The commands below use the full `.venv/bin/python -m pytest` form so they work
> whether or not the venv is activated. If you activated it, plain `pytest` works too.


```bash
# run everything
.venv/bin/python -m pytest

# a single file / single test
.venv/bin/python -m pytest tests/test_fixtures.py
.venv/bin/python -m pytest tests/test_markers.py::test_skipif_old_python

# filter by name substring, or by custom marker
.venv/bin/python -m pytest -k "fizzbuzz"
.venv/bin/python -m pytest -m smoke

# verbose, show skip/xfail reasons
.venv/bin/python -m pytest -v -ra
```

## Expected result

The suite is designed so the *intentional* non-passes are part of the demo:

```
51 passed, 1 skipped, 2 xfailed, 1 xpassed
```

- `skipped` — `test_always_skipped` (unconditional `@pytest.mark.skip`)
- `xfailed` — known-bug demos (`@pytest.mark.xfail`)
- `xpassed` — an xfail-marked test that actually passes (documents a fixed bug)
