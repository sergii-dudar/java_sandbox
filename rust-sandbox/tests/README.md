# Rust testing examples — all variants

A self-contained Cargo crate (`test1`) that demonstrates every major Rust
testing "variant", from the built-in `#[test]` harness to property testing,
snapshots, async, mocking, compile-fail tests, benchmarks and fuzzing.

It is the Rust counterpart to the `pytest-tests`, `unittest-tests` and
`bashunit-tests` suites elsewhere in this repo.

## Layout

```
rust-sandbox/tests/
├── Cargo.toml                 # deps + dev-deps for every testing tool below
├── Makefile                   # ~60 `make` targets (run `make help`)
├── .config/nextest.toml       # cargo-nextest profiles (ci / quick / with-output)
├── src/
│   ├── lib.rs                 # library crate root (themed modules)
│   ├── main.rs                # binary entry point
│   ├── math.rs strings.rs collections.rs shapes.rs bank.rs
│   ├── parser.rs async_utils.rs services.rs
│   └── units/                 # #[cfg(test)] unit tests, one module per theme
│       ├── math_tests.rs            # basic #[test], assert*! macros
│       ├── strings_tests.rs
│       ├── collections_tests.rs
│       ├── shapes_tests.rs
│       ├── bank_tests.rs            # account logic unit tests
│       ├── parser_tests.rs
│       ├── parametrized_tests.rs    # rstest #[case] parametrization
│       ├── proptest_tests.rs        # proptest property tests
│       ├── quickcheck_tests.rs      # quickcheck property tests
│       ├── snapshot_tests.rs        # insta snapshot tests
│       ├── async_tests.rs           # tokio / async-std / futures async tests
│       ├── mock_tests.rs            # mockall mocks
│       ├── rstest_advanced_tests.rs # fixtures, async cases, timeouts
│       └── test_case_matchers_tests.rs # test-case attribute + matchers
├── tests/                     # integration tests (separate crates)
│   ├── common/mod.rs          # shared test helpers
│   ├── *_integration.rs       # black-box tests of the public API
│   ├── trybuild_tests.rs      # compile-pass/fail tests
│   └── ui/                    # trybuild UI fixtures (pass_*.rs)
├── benches/                   # Criterion benchmarks (math / strings)
└── fuzz/                      # cargo-fuzz targets (parse / reverse)
```

## Variants covered

| Area | Tooling | Where |
|------|---------|-------|
| Unit tests | built-in `#[test]`, `assert!`, `assert_eq!` | `src/units/*` |
| `#[should_panic]` / `-> Result` tests | std harness | `math_tests.rs`, others |
| `#[ignore]` tests | std harness | various, see `make test-ignored` |
| Doc tests | `cargo test --doc` | doc comments in `src/` |
| Integration (black-box) | separate crates under `tests/` | `*_integration.rs` |
| Parametrized | `rstest`, `test-case` | `parametrized_tests.rs`, `test_case_matchers_tests.rs` |
| Property-based | `proptest`, `quickcheck` | `proptest_tests.rs`, `quickcheck_tests.rs` |
| Snapshot | `insta` | `snapshot_tests.rs` |
| Async | `tokio`, `async-std`, `futures` | `async_tests.rs` |
| Mocking | `mockall` | `mock_tests.rs` |
| Compile-fail / UI | `trybuild` | `trybuild_tests.rs`, `tests/ui/` |
| Benchmarks | `criterion` | `benches/` |
| Fuzzing | `cargo-fuzz` (nightly) | `fuzz/` |
| Fast runner | `cargo-nextest` (+ filter expressions) | `make nextest*` |
| Coverage | `cargo-llvm-cov`, `cargo-tarpaulin` | `make coverage*` |
| Mutation testing | `cargo-mutants` | `make mutants` |

## Running

```bash
cd rust-sandbox/tests

make help                # list every target with a description
make test                # cargo test — unit + integration + doc
make test-lib            # only unit tests
make test-doc            # only doc tests
make test-integration    # only tests/ files
make nextest             # fast parallel runner (needs cargo-nextest)

# specialized suites
make test-property       # proptest + quickcheck
make test-snapshot       # insta (use `make insta-review` to approve changes)
make test-async          # tokio / async-std
make test-mock           # mockall
make test-trybuild       # compile-pass/fail checks
make bench               # Criterion benchmarks
make coverage            # cargo llvm-cov

# one-time tool install for the optional targets
make install-tools       # nextest, insta, llvm-cov, tarpaulin, mutants, fuzz
```

Plain Cargo works too: `cargo test`, `cargo test math` (filter by substring),
`cargo test -- --ignored`, `cargo bench`.
