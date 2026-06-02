# Test recipes for the Go `sandbox-tests` module.
#
# Groups:
#   * plain `go test` variants
#   * subtests / table tests / parallel
#   * benchmarks
#   * fuzz tests (Go 1.18+ built-in)
#   * race detector
#   * coverage
#   * examples
#   * property-based (rapid)
#   * snapshot (cupaloy)
#   * testify (assert/require/suite/mock)
#   * gomock
#   * httptest
#   * BDD (ginkgo/gomega)
#   * integration (build tags)
#   * gotestsum (alternative runner)
#
# Run `make help` to see all targets.

GO          ?= go
GOTESTSUM   ?= gotestsum
PKGS        ?= ./...

.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help.
	@awk 'BEGIN {FS = ":.*##"; printf "Available targets:\n"} \
		/^[a-zA-Z0-9_.-]+:.*##/ { printf "  \033[36m%-32s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

# =============================================================================
# Plain `go test` variants
# =============================================================================

.PHONY: test
test: ## go test ./... — run all tests in all packages.
	$(GO) test $(PKGS)

.PHONY: test-verbose
test-verbose: ## go test -v ./... — show each test name and result.
	$(GO) test -v $(PKGS)

.PHONY: test-short
test-short: ## go test -short ./... — skip tests that check testing.Short().
	$(GO) test -short $(PKGS)

.PHONY: test-count
test-count: ## go test -count=5 ./... — run each test N times (disables caching).
	$(GO) test -count=5 $(PKGS)

.PHONY: test-shuffle
test-shuffle: ## go test -shuffle=on ./... — randomise test order.
	$(GO) test -shuffle=on $(PKGS)

.PHONY: test-failfast
test-failfast: ## go test -failfast ./... — stop at first failure.
	$(GO) test -failfast $(PKGS)

.PHONY: test-timeout
test-timeout: ## go test -timeout=30s ./... — abort after timeout.
	$(GO) test -timeout=30s $(PKGS)

.PHONY: test-parallel
test-parallel: ## go test -parallel=8 ./... — max parallel sub-tests with t.Parallel.
	$(GO) test -parallel=8 $(PKGS)

.PHONY: test-json
test-json: ## go test -json ./... — machine-readable output.
	$(GO) test -json $(PKGS)

.PHONY: test-run
test-run: ## go test -run=TestAdd ./math — filter tests by regex.
	$(GO) test -v -run=TestAdd$$ ./math

.PHONY: test-subtest
test-subtest: ## go test -run='TestAddTable/positives' ./math — single subtest.
	$(GO) test -v -run='TestAddTable/positives' ./math

.PHONY: test-pkg
test-pkg: ## go test ./math — single package.
	$(GO) test ./math

.PHONY: test-vet-off
test-vet-off: ## go test -vet=off ./... — skip vet checks.
	$(GO) test -vet=off $(PKGS)

# =============================================================================
# Race detector
# =============================================================================

.PHONY: race
race: ## go test -race ./... — run with the race detector.
	$(GO) test -race $(PKGS)

.PHONY: race-short
race-short: ## go test -race -short ./....
	$(GO) test -race -short $(PKGS)

# =============================================================================
# Coverage
# =============================================================================

.PHONY: coverage
coverage: ## go test -cover ./... — print coverage summary.
	$(GO) test -cover $(PKGS)

.PHONY: coverage-profile
coverage-profile: ## Write coverage.out and print func-level summary.
	$(GO) test -coverprofile=coverage.out $(PKGS)
	$(GO) tool cover -func=coverage.out

.PHONY: coverage-html
coverage-html: coverage-profile ## Open coverage.html in browser.
	$(GO) tool cover -html=coverage.out -o coverage.html

.PHONY: coverage-atomic
coverage-atomic: ## Coverage with -covermode=atomic (needed with -race).
	$(GO) test -covermode=atomic -coverprofile=coverage.out $(PKGS)

# =============================================================================
# Benchmarks
# =============================================================================

.PHONY: bench
bench: ## go test -bench=. -run=^$ ./... — run all benchmarks.
	$(GO) test -bench=. -run=^$$ $(PKGS)

.PHONY: bench-math
bench-math: ## Benchmarks in ./math only.
	$(GO) test -bench=. -run=^$$ ./math

.PHONY: bench-mem
bench-mem: ## go test -bench=. -benchmem -run=^$ ./...
	$(GO) test -bench=. -benchmem -run=^$$ $(PKGS)

.PHONY: bench-time
bench-time: ## go test -bench=. -benchtime=5s -run=^$ ./...
	$(GO) test -bench=. -benchtime=5s -run=^$$ $(PKGS)

.PHONY: bench-count
bench-count: ## go test -bench=. -count=3 -run=^$ ./... — stat-friendly repeats.
	$(GO) test -bench=. -count=3 -run=^$$ $(PKGS)

.PHONY: bench-cpu
bench-cpu: ## CPU profile to cpu.prof.
	$(GO) test -bench=. -run=^$$ -cpuprofile=cpu.prof ./math

# =============================================================================
# Fuzz tests (Go 1.18+ built-in)
# =============================================================================

.PHONY: fuzz-list
fuzz-list: ## List discoverable fuzz targets via -list.
	$(GO) test -list '^Fuzz' $(PKGS)

.PHONY: fuzz-add
fuzz-add: ## go test -fuzz=FuzzAddCommutative -fuzztime=10s ./math.
	$(GO) test -fuzz=FuzzAddCommutative -fuzztime=10s ./math

.PHONY: fuzz-gcd
fuzz-gcd: ## go test -fuzz=FuzzGCDDivides -fuzztime=10s ./math.
	$(GO) test -fuzz=FuzzGCDDivides -fuzztime=10s ./math

.PHONY: fuzz-seed-only
fuzz-seed-only: ## Run only the seed corpus of fuzz targets (no -fuzz flag).
	$(GO) test -run='^Fuzz' ./math

# =============================================================================
# Examples
# =============================================================================

.PHONY: examples
examples: ## Run only Example functions (verified by // Output:).
	$(GO) test -v -run='^Example' ./math

# =============================================================================
# Specialized style targets
# =============================================================================

.PHONY: test-table
test-table: ## Run table-driven + subtest examples.
	$(GO) test -v -run='Table|Parallel|Grouped' ./math

.PHONY: test-blackbox
test-blackbox: ## Black-box tests in `strs` (separate _test package).
	$(GO) test -v -run='BlackBox' ./strs

.PHONY: test-testify
test-testify: ## Tests using stretchr/testify.
	$(GO) test -v -run='Testify|StringSuite' ./strs

.PHONY: test-property
test-property: ## Property-based tests (rapid).
	$(GO) test -v -run='Involution|Idempotent|Bounded' ./strs

.PHONY: test-snapshot
test-snapshot: ## Snapshot tests (cupaloy).
	$(GO) test -v -run='Snapshot' ./strs

.PHONY: test-snapshot-update
test-snapshot-update: ## UPDATE_SNAPSHOTS=true — accept new snapshots.
	UPDATE_SNAPSHOTS=true $(GO) test -v -run='Snapshot' ./strs

.PHONY: test-mock-testify
test-mock-testify: ## testify/mock based tests in services.
	$(GO) test -v -run='Portfolio_Total' ./services

.PHONY: test-mock-gomock
test-mock-gomock: ## gomock based tests in services.
	$(GO) test -v -run='Portfolio_GoMock' ./services

.PHONY: test-http
test-http: ## httptest based handler tests.
	$(GO) test -v ./httpapi

.PHONY: test-bdd
test-bdd: ## Ginkgo/Gomega BDD suite.
	$(GO) test -v ./bdd

# =============================================================================
# Integration tests (build-tag gated)
# =============================================================================

.PHONY: integration
integration: ## go test -tags=integration ./integration.
	$(GO) test -v -tags=integration ./integration

.PHONY: test-all-with-integration
test-all-with-integration: ## All tests + integration tag.
	$(GO) test -tags=integration $(PKGS)

# =============================================================================
# gotestsum (alternative runner with grouped output, JUnit XML, etc.)
# =============================================================================

.PHONY: gotestsum
gotestsum: ## gotestsum --format=testname.
	$(GOTESTSUM) --format=testname -- $(PKGS)

.PHONY: gotestsum-dots
gotestsum-dots: ## gotestsum --format=dots.
	$(GOTESTSUM) --format=dots -- $(PKGS)

.PHONY: gotestsum-junit
gotestsum-junit: ## gotestsum --junitfile=junit.xml.
	$(GOTESTSUM) --junitfile=junit.xml -- $(PKGS)

.PHONY: gotestsum-watch
gotestsum-watch: ## gotestsum --watch — re-run on file changes.
	$(GOTESTSUM) --watch -- $(PKGS)

# =============================================================================
# Lint / vet / static analysis
# =============================================================================

.PHONY: vet
vet: ## go vet ./....
	$(GO) vet $(PKGS)

.PHONY: tidy
tidy: ## go mod tidy.
	$(GO) mod tidy

# =============================================================================
# Demo entry point
# =============================================================================

.PHONY: demo
demo: ## go run ./cmd/demo — exercise each library package.
	$(GO) run ./cmd/demo

.PHONY: demo-build
demo-build: ## Build the demo binary to bin/demo.
	$(GO) build -o bin/demo ./cmd/demo

.PHONY: demo-run
demo-run: demo-build ## Build and run the demo binary.
	./bin/demo

# =============================================================================
# Misc
# =============================================================================

.PHONY: clean
clean: ## Remove generated artifacts.
	rm -rf coverage.out coverage.html cpu.prof mem.prof junit.xml bin/
	$(GO) clean -testcache

.PHONY: install-tools
install-tools: ## Install gotestsum and mockgen.
	$(GO) install gotest.tools/gotestsum@latest
	$(GO) install go.uber.org/mock/mockgen@latest
