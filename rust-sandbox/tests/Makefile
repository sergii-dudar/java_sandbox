# Test recipes for the `test1` crate.
#
# Groups:
#   * plain `cargo test` variants
#   * `cargo nextest` variants
#   * Criterion benchmarks (`cargo bench`)
#   * property tests (proptest / quickcheck)
#   * snapshot tests (insta)
#   * async tests (tokio / async-std)
#   * mock tests (mockall)
#   * compile tests (trybuild)
#   * fuzz tests (cargo-fuzz, nightly)
#   * coverage (cargo-llvm-cov / cargo-tarpaulin)
#   * mutation testing (cargo-mutants)
#
# Run `make help` to see all targets.

CARGO        ?= cargo
NEXTEST      ?= $(CARGO) nextest
PKG          ?= test1
FUZZ_DIR     ?= fuzz
NIGHTLY      ?= +nightly

.DEFAULT_GOAL := help

# -----------------------------------------------------------------------------
.PHONY: help
help: ## Show this help.
	@awk 'BEGIN {FS = ":.*##"; printf "Available targets:\n"} \
		/^[a-zA-Z0-9_.-]+:.*##/ { printf "  \033[36m%-32s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

# =============================================================================
# Plain `cargo test` variants
# =============================================================================

.PHONY: test
test: ## cargo test — all tests (unit + integration + doc).
	$(CARGO) test

.PHONY: test-lib
test-lib: ## cargo test --lib — only unit tests in src/.
	$(CARGO) test --lib

.PHONY: test-doc
test-doc: ## cargo test --doc — only doc tests.
	$(CARGO) test --doc

.PHONY: test-integration
test-integration: ## cargo test --tests — only files under tests/.
	$(CARGO) test --tests

.PHONY: test-release
test-release: ## cargo test --release — optimized build.
	$(CARGO) test --release

.PHONY: test-ignored
test-ignored: ## cargo test -- --ignored — run only #[ignore]-d tests.
	$(CARGO) test -- --ignored

.PHONY: test-all
test-all: ## cargo test -- --include-ignored — run everything.
	$(CARGO) test -- --include-ignored

.PHONY: test-nocapture
test-nocapture: ## cargo test -- --nocapture — show stdout/stderr.
	$(CARGO) test -- --nocapture

.PHONY: test-single-thread
test-single-thread: ## cargo test -- --test-threads=1 — deterministic order.
	$(CARGO) test -- --test-threads=1

.PHONY: test-math
test-math: ## cargo test math — filter by substring.
	$(CARGO) test math

.PHONY: test-parametrized
test-parametrized: ## cargo test parametrized — only the parametrized suite.
	$(CARGO) test parametrized

.PHONY: test-integration-file
test-integration-file: ## cargo test --test parametrized_integration.
	$(CARGO) test --test parametrized_integration

.PHONY: test-json
test-json: ## cargo test with libtest JSON output (requires nightly libtest features).
	RUSTC_BOOTSTRAP=1 $(CARGO) test -- -Z unstable-options --format json --report-time

# =============================================================================
# `cargo nextest` variants
# =============================================================================

.PHONY: nextest
nextest: ## cargo nextest run — fast parallel test runner.
	$(NEXTEST) run

.PHONY: nt
nt: nextest ## Alias for `nextest`.

.PHONY: nextest-lib
nextest-lib: ## nextest run --lib — only unit tests.
	$(NEXTEST) run --lib

.PHONY: nextest-tests
nextest-tests: ## nextest run --tests — only integration tests.
	$(NEXTEST) run --tests

.PHONY: nextest-release
nextest-release: ## nextest run --release.
	$(NEXTEST) run --release

.PHONY: nextest-ci
nextest-ci: ## nextest run --profile ci — retries + verbose failures.
	$(NEXTEST) run --profile ci

.PHONY: nextest-quick
nextest-quick: ## nextest run --profile quick — fail-fast.
	$(NEXTEST) run --profile quick

.PHONY: nextest-output
nextest-output: ## nextest run --profile with-output — show stdout for all tests.
	$(NEXTEST) run --profile with-output

.PHONY: nextest-no-capture
nextest-no-capture: ## nextest run --no-capture — stream output live.
	$(NEXTEST) run --no-capture

.PHONY: nextest-ignored
nextest-ignored: ## nextest run --run-ignored only — only #[ignore]-d tests.
	$(NEXTEST) run --run-ignored only

.PHONY: nextest-all
nextest-all: ## nextest run --run-ignored all — include ignored.
	$(NEXTEST) run --run-ignored all

.PHONY: nextest-retries
nextest-retries: ## nextest run --retries 3 — retry flaky tests.
	$(NEXTEST) run --retries 3

.PHONY: nextest-jobs
nextest-jobs: ## nextest run -j 1 — single-threaded execution.
	$(NEXTEST) run -j 1

.PHONY: nextest-list
nextest-list: ## nextest list — list all discovered tests.
	$(NEXTEST) list

.PHONY: nextest-list-binaries
nextest-list-binaries: ## nextest list --list-type binaries-only.
	$(NEXTEST) list --list-type binaries-only

# -----------------------------------------------------------------------------
# Nextest with filter expressions
# -----------------------------------------------------------------------------

.PHONY: nextest-math
nextest-math: ## nextest filter: only math_tests module.
	$(NEXTEST) run -E 'test(math)'

.PHONY: nextest-parametrized
nextest-parametrized: ## nextest filter: only parametrized tests.
	$(NEXTEST) run -E 'test(parametrized) or test(/_table/) or test(/_cases/)'

.PHONY: nextest-unit-only
nextest-unit-only: ## nextest filter: only the library's unit tests.
	$(NEXTEST) run -E 'kind(lib)'

.PHONY: nextest-integration-only
nextest-integration-only: ## nextest filter: only integration test binaries.
	$(NEXTEST) run -E 'kind(test)'

.PHONY: nextest-not-slow
nextest-not-slow: ## nextest filter: skip anything matching /slow/.
	$(NEXTEST) run -E 'not test(/slow/)'

.PHONY: nextest-pkg
nextest-pkg: ## nextest run -p test1 — scoped to this package.
	$(NEXTEST) run -p $(PKG)

# =============================================================================
# Specialized test-style targets
# =============================================================================

# --- Property-based tests ----------------------------------------------------
.PHONY: test-proptest
test-proptest: ## cargo test proptest_tests — only proptest cases.
	$(CARGO) test proptest_tests

.PHONY: test-quickcheck
test-quickcheck: ## cargo test quickcheck_tests — only quickcheck cases.
	$(CARGO) test quickcheck_tests

.PHONY: test-property
test-property: test-proptest test-quickcheck ## Run both property-testing suites.

# --- Snapshot tests (insta) --------------------------------------------------
.PHONY: test-snapshot
test-snapshot: ## cargo test snapshot_tests — run insta snapshot tests.
	$(CARGO) test snapshot_tests

.PHONY: insta-review
insta-review: ## cargo insta review — interactively approve snapshot changes.
	$(CARGO) insta review

.PHONY: insta-accept
insta-accept: ## cargo insta accept — accept all pending snapshots.
	$(CARGO) insta accept

# --- Async tests -------------------------------------------------------------
.PHONY: test-async
test-async: ## cargo test async_tests — tokio / async-std / futures cases.
	$(CARGO) test async_tests

# --- Mock tests (mockall) ----------------------------------------------------
.PHONY: test-mock
test-mock: ## cargo test mock_tests — mockall-driven tests.
	$(CARGO) test mock_tests

# --- rstest advanced ---------------------------------------------------------
.PHONY: test-rstest-advanced
test-rstest-advanced: ## cargo test rstest_advanced_tests.
	$(CARGO) test rstest_advanced_tests

# --- test-case matchers ------------------------------------------------------
.PHONY: test-case-matchers
test-case-matchers: ## cargo test test_case_matchers_tests.
	$(CARGO) test test_case_matchers_tests

# --- Compile tests (trybuild) ------------------------------------------------
.PHONY: test-trybuild
test-trybuild: ## cargo test --test trybuild_tests — compile-pass/fail checks.
	$(CARGO) test --test trybuild_tests

# =============================================================================
# Criterion benchmarks
# =============================================================================

.PHONY: bench
bench: ## cargo bench — run all Criterion benchmarks.
	$(CARGO) bench

.PHONY: bench-math
bench-math: ## cargo bench --bench math_bench.
	$(CARGO) bench --bench math_bench

.PHONY: bench-strings
bench-strings: ## cargo bench --bench strings_bench.
	$(CARGO) bench --bench strings_bench

.PHONY: bench-quick
bench-quick: ## cargo bench -- --quick — short measurement window.
	$(CARGO) bench -- --quick

.PHONY: bench-save
bench-save: ## cargo bench -- --save-baseline main — store a baseline.
	$(CARGO) bench -- --save-baseline main

.PHONY: bench-compare
bench-compare: ## cargo bench -- --baseline main — compare against baseline.
	$(CARGO) bench -- --baseline main

# =============================================================================
# Fuzz testing (requires nightly Rust + `cargo install cargo-fuzz`)
# =============================================================================

.PHONY: fuzz-list
fuzz-list: ## cargo fuzz list — show fuzz targets.
	cargo $(NIGHTLY) fuzz list

.PHONY: fuzz-parse
fuzz-parse: ## cargo fuzz run parse_fuzz (nightly).
	cargo $(NIGHTLY) fuzz run parse_fuzz

.PHONY: fuzz-reverse
fuzz-reverse: ## cargo fuzz run reverse_fuzz (nightly).
	cargo $(NIGHTLY) fuzz run reverse_fuzz

.PHONY: fuzz-short
fuzz-short: ## cargo fuzz run parse_fuzz -- -max_total_time=10.
	cargo $(NIGHTLY) fuzz run parse_fuzz -- -max_total_time=10

# =============================================================================
# Coverage
# =============================================================================

.PHONY: coverage
coverage: ## cargo llvm-cov — text coverage report.
	$(CARGO) llvm-cov

.PHONY: coverage-html
coverage-html: ## cargo llvm-cov --html — HTML report at target/llvm-cov/html.
	$(CARGO) llvm-cov --html

.PHONY: coverage-lcov
coverage-lcov: ## cargo llvm-cov --lcov --output-path lcov.info.
	$(CARGO) llvm-cov --lcov --output-path lcov.info

.PHONY: coverage-nextest
coverage-nextest: ## cargo llvm-cov nextest — coverage via nextest.
	$(CARGO) llvm-cov nextest

.PHONY: coverage-tarpaulin
coverage-tarpaulin: ## cargo tarpaulin --out Html — alternative coverage tool.
	$(CARGO) tarpaulin --out Html

# =============================================================================
# Mutation testing
# =============================================================================

.PHONY: mutants
mutants: ## cargo mutants — run mutation tests.
	$(CARGO) mutants

.PHONY: mutants-nextest
mutants-nextest: ## cargo mutants --test-tool=nextest.
	$(CARGO) mutants --test-tool=nextest

# =============================================================================
# Misc
# =============================================================================

.PHONY: clean
clean: ## cargo clean.
	$(CARGO) clean

.PHONY: install-tools
install-tools: ## Install all extra tools used by these targets.
	$(CARGO) install cargo-nextest --locked
	$(CARGO) install cargo-insta
	$(CARGO) install cargo-llvm-cov
	$(CARGO) install cargo-tarpaulin
	$(CARGO) install cargo-mutants
	$(CARGO) install cargo-fuzz
