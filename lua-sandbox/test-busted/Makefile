# Test recipes for the Lua/Busted suite.
#
# Run `make help` to see all targets.

BUSTED ?= busted
LUA    ?= lua

.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help.
	@awk 'BEGIN {FS = ":.*##"; printf "Available targets:\n"} \
		/^[a-zA-Z0-9_.-]+:.*##/ { printf "  \033[36m%-32s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

# -----------------------------------------------------------------------------
# Standard runs
# -----------------------------------------------------------------------------

.PHONY: test
test: ## Run all specs with default output.
	$(BUSTED)

.PHONY: test-verbose
test-verbose: ## -v / --verbose — show every test name.
	$(BUSTED) --verbose

.PHONY: test-color
test-color: ## utfTerminal output with colour (default).
	$(BUSTED) --output=utfTerminal

.PHONY: test-plain
test-plain: ## plainTerminal — no colour, simpler for parsers.
	$(BUSTED) --output=plainTerminal

# -----------------------------------------------------------------------------
# Output formats (each is a distinct format your framework must parse)
# -----------------------------------------------------------------------------

.PHONY: test-tap
test-tap: ## TAP output.
	$(BUSTED) --output=TAP

.PHONY: test-junit
test-junit: ## JUnit XML to test-results.xml.
	$(BUSTED) -o junit > test-results.xml || true
	@echo "JUnit XML written to test-results.xml"

.PHONY: test-json
test-json: ## JSON output (machine-readable).
	$(BUSTED) --output=json

.PHONY: test-gtest
test-gtest: ## gtest-style output.
	$(BUSTED) --output=gtest

# -----------------------------------------------------------------------------
# Profiles (defined in .busted)
# -----------------------------------------------------------------------------

.PHONY: profile-ci
profile-ci: ## Run with the `ci` profile (plain + verbose).
	$(BUSTED) --run=ci

.PHONY: profile-tap
profile-tap: ## Run with the `tap` profile.
	$(BUSTED) --run=tap

.PHONY: profile-json
profile-json: ## Run with the `json` profile.
	$(BUSTED) --run=json

.PHONY: profile-junit
profile-junit: ## Run with the `junit` profile (writes test-results.xml).
	$(BUSTED) --run=junit

# -----------------------------------------------------------------------------
# Filters
# -----------------------------------------------------------------------------

.PHONY: test-math
test-math: ## Only the math_spec.
	$(BUSTED) spec/math_spec.lua

.PHONY: test-strs
test-strs: ## Only the strs_spec.
	$(BUSTED) spec/strs_spec.lua

.PHONY: test-mocks
test-mocks: ## Only the mocks_spec.
	$(BUSTED) spec/mocks_spec.lua

.PHONY: test-property
test-property: ## Only the property_spec.
	$(BUSTED) spec/property_spec.lua

.PHONY: test-integration
test-integration: ## Only the services integration spec.
	$(BUSTED) spec/services_integration_spec.lua

.PHONY: test-parametrized
test-parametrized: ## Only the table-driven math spec.
	$(BUSTED) spec/math_parametrized_spec.lua

.PHONY: test-pending
test-pending: ## Only the pending/async/skip spec.
	$(BUSTED) spec/pending_async_spec.lua

.PHONY: test-filter
test-filter: ## --filter='palindrome' — regex filter on test description.
	$(BUSTED) --filter='palindrome'

.PHONY: test-tag-fast
test-tag-fast: ## --tags=fast — only tests tagged with #fast.
	$(BUSTED) --tags=fast

.PHONY: test-tag-not-slow
test-tag-not-slow: ## --exclude-tags=slow — skip tests tagged #slow.
	$(BUSTED) --exclude-tags=slow

# -----------------------------------------------------------------------------
# Diagnostics
# -----------------------------------------------------------------------------

.PHONY: test-list
test-list: ## --list — list discovered tests instead of running.
	$(BUSTED) --list

.PHONY: test-shuffle
test-shuffle: ## --shuffle — randomise file/test order.
	$(BUSTED) --shuffle

.PHONY: test-repeat
test-repeat: ## --repeat=5 — re-run each test N times.
	$(BUSTED) --repeat=5

.PHONY: test-defer-print
test-defer-print: ## --defer-print — buffer print() until after tests.
	$(BUSTED) --defer-print

.PHONY: test-suppress-pending
test-suppress-pending: ## --suppress-pending — hide pending output.
	$(BUSTED) --suppress-pending

.PHONY: test-coverage
test-coverage: ## --coverage — collect luacov coverage (needs luacov installed).
	$(BUSTED) --coverage
	@command -v luacov >/dev/null && luacov || \
		echo "(install luacov to render the luacov.report.out report)"

# -----------------------------------------------------------------------------
# Setup
# -----------------------------------------------------------------------------

.PHONY: install
install: ## luarocks --local install busted luacov.
	luarocks --local install busted
	luarocks --local install luacov

.PHONY: clean
clean: ## Remove generated artifacts.
	rm -f luacov.stats.out luacov.report.out test-results.xml
