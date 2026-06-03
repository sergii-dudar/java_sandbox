# Go testing examples — all variants

A self-contained Go module (`sandbox-tests`) demonstrating every major Go
testing "variant": the built-in `testing` package, subtests, table-driven tests,
parallelism, benchmarks, fuzzing, examples, the race detector, plus popular
third-party tools (testify, gomock, ginkgo/gomega, rapid, cupaloy).

It is the Go counterpart to the `pytest-tests`, `unittest-tests` and
`bashunit-tests` suites elsewhere in this repo.

## Layout

```
go-sandbox/tests/
├── go.mod / go.sum            # testify, ginkgo, gomega, gomock, rapid, cupaloy
├── Makefile                   # ~50 `make` targets (run `make help`)
├── math/
│   ├── math.go
│   ├── math_test.go              # basic tests, t.Run subtests
│   ├── math_table_test.go        # table-driven + t.Parallel subtests
│   ├── math_example_test.go      # Example funcs verified by // Output:
│   ├── math_bench_test.go        # Benchmark funcs
│   └── math_fuzz_test.go         # Go 1.18+ built-in fuzzing
├── strs/
│   ├── strs.go
│   ├── strs_blackbox_test.go     # external `strs_test` package (black-box)
│   ├── strs_testify_test.go      # testify assert/require/suite
│   ├── strs_property_test.go     # property-based via pgregory.net/rapid
│   ├── strs_snapshot_test.go     # snapshot via cupaloy
│   └── .snapshots/               # committed snapshot fixtures
├── services/
│   ├── services.go
│   ├── services_testifymock_test.go # testify/mock
│   └── services_gomock_test.go      # go.uber.org/mock (gomock)
├── httpapi/
│   ├── api.go
│   └── api_test.go               # net/http/httptest handler tests
├── bdd/
│   └── bdd_test.go               # Ginkgo/Gomega BDD suite
├── integration/
│   ├── doc.go
│   └── integration_test.go       # //go:build integration tag-gated
└── cmd/demo/main.go              # runnable demo of each package
```

## Variants covered

| Area | Tooling | Where |
|------|---------|-------|
| Basic tests / subtests | `testing`, `t.Run` | `math/math_test.go` |
| Table-driven + parallel | `testing`, `t.Parallel` | `math/math_table_test.go` |
| Benchmarks | `testing.B` | `math/math_bench_test.go` |
| Fuzzing | built-in `testing.F` (Go 1.18+) | `math/math_fuzz_test.go` |
| Examples | `Example*` + `// Output:` | `math/math_example_test.go` |
| Black-box package | `package strs_test` | `strs/strs_blackbox_test.go` |
| Assertions / suite | `stretchr/testify` | `strs/strs_testify_test.go` |
| Property-based | `pgregory.net/rapid` | `strs/strs_property_test.go` |
| Snapshot | `bradleyjkemp/cupaloy` | `strs/strs_snapshot_test.go` |
| Mocking (testify) | `testify/mock` | `services/services_testifymock_test.go` |
| Mocking (gomock) | `go.uber.org/mock` | `services/services_gomock_test.go` |
| HTTP handlers | `net/http/httptest` | `httpapi/api_test.go` |
| BDD | `ginkgo` / `gomega` | `bdd/bdd_test.go` |
| Integration (tag-gated) | `//go:build integration` | `integration/` |
| Race detector | `go test -race` | `make race` |
| Coverage | `go tool cover` | `make coverage*` |
| Alternative runner | `gotestsum` | `make gotestsum*` |

## Running

```bash
cd go-sandbox/tests

make help                # list every target with a description

make test                # go test ./...
make test-verbose        # go test -v ./...
make race                # go test -race ./...
make coverage-html       # HTML coverage report

# specialized suites
make test-table          # table-driven + parallel subtests
make test-blackbox       # external-package tests
make test-testify        # testify
make test-property       # rapid property tests
make test-snapshot       # cupaloy snapshots (update: make test-snapshot-update)
make test-mock-testify   # testify/mock
make test-mock-gomock    # gomock
make test-http           # httptest
make test-bdd            # ginkgo/gomega
make bench               # benchmarks
make fuzz-add            # fuzz a target for 10s
make integration         # build-tag gated integration tests

make install-tools       # gotestsum + mockgen
```

Plain `go test` works too: `go test ./...`, `go test -run TestAdd ./math`,
`go test -bench=. ./math`, `go test -fuzz=FuzzAddCommutative ./math`.
