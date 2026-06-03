# bashunit examples — all variants

A self-contained collection of [bashunit](https://bashunit.typeddevs.com) tests that
demonstrate every major feature ("variant") of the framework.

## Layout

```
bashunit-tests/
├── src/                       # tiny "system under test" libraries
│   ├── calculator.sh
│   └── strings.sh
└── tests/                     # one file per bashunit feature
    ├── equality_test.sh          # assert_equals / same / true / false / empty
    ├── numeric_test.sh           # greater/less (or equal) than
    ├── strings_test.sh           # contains, matches, starts/ends with, format, line_count
    ├── arrays_test.sh            # assert_array_contains / arrays_equal (-- separator)
    ├── exit_code_test.sh         # successful/general_error/exit_code/assert_exec
    ├── files_folders_test.sh     # file & directory assertions + temp fixtures
    ├── lifecycle_test.sh         # set_up(_before_script) / tear_down(_after_script) + custom title
    ├── data_provider_test.sh     # @data_provider parameterized tests
    ├── test_doubles_test.sh      # bashunit::mock and bashunit::spy
    ├── skipping_incomplete_test.sh # bashunit::skip / bashunit::todo
    ├── custom_asserts_test.sh    # building your own assertions
    ├── dates_duration_json_test.sh # date / duration / json assertions
    └── snapshot_test.sh          # assert_match_snapshot(_ignore_colors)
```

## Running

```bash
# run everything
bashunit tests/

# run a single file
bashunit tests/test_doubles_test.sh

# filter by test name
bashunit tests/ --filter "spy"
```

## Notes / gotchas demonstrated

- `assert_true "expr"` / `assert_false "expr"`: the string is run as a single command.
  To pass arguments, prefix with `eval`, e.g. `assert_true "eval is_even 4"`.
- `assert_arrays_equal "${a[@]}" -- "${b[@]}"`: expected/actual are split by a literal `--`.
- `assert_exec "cmd" --exit 0 --stdout "..." --stderr-contains "..."`: command is the
  first argument; expectations are passed as flags.
- JSON assertions take a **jq path** (`.name`) and require `jq` (auto-skipped if missing).
- Date assertions: the **second** argument is the subject, the first is the reference
  (`assert_date_before "$reference" "$subject"`).
- Snapshots are generated on the first run under `tests/snapshots/`, then compared on
  subsequent runs. Delete a `.snapshot` file to regenerate it.
