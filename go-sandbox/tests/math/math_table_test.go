package math

import (
	"fmt"
	"testing"
)

// -----------------------------------------------------------------------------
// Table-driven tests + subtests (`t.Run`) — Go's canonical parametrized form.
// Each row becomes its own SUBTEST visible in `go test -v` and parsers as
// `TestFunc/Subtest_name`.
// -----------------------------------------------------------------------------

func TestAddTable(t *testing.T) {
	cases := []struct {
		name       string
		a, b, want int
	}{
		{"positives", 2, 3, 5},
		{"negatives", -1, -2, -3},
		{"zeroes", 0, 0, 0},
		{"mixed_signs", -5, 10, 5},
		{"large", 1_000_000, 250_000, 1_250_000},
	}
	for _, tc := range cases {
		tc := tc // capture range variable
		t.Run(tc.name, func(t *testing.T) {
			if got := Add(tc.a, tc.b); got != tc.want {
				t.Errorf("Add(%d,%d) = %d; want %d", tc.a, tc.b, got, tc.want)
			}
		})
	}
}

func TestFactorialTable(t *testing.T) {
	cases := map[string]struct {
		n, want int
	}{
		"zero":    {0, 1},
		"one":     {1, 1},
		"five":    {5, 120},
		"ten":     {10, 3628800},
		"negative": {-1, 0},
	}
	for name, tc := range cases {
		tc := tc
		t.Run(name, func(t *testing.T) {
			if got := Factorial(tc.n); got != tc.want {
				t.Errorf("Factorial(%d) = %d; want %d", tc.n, got, tc.want)
			}
		})
	}
}

// -----------------------------------------------------------------------------
// Parallel subtests — `t.Parallel()` inside each subtest.
// -----------------------------------------------------------------------------

func TestIsPrimeParallel(t *testing.T) {
	cases := []struct {
		n    int
		want bool
	}{
		{0, false}, {1, false}, {2, true}, {3, true}, {4, false},
		{13, true}, {15, false}, {97, true}, {100, false}, {7919, true},
	}
	for _, tc := range cases {
		tc := tc
		t.Run(fmt.Sprintf("n=%d", tc.n), func(t *testing.T) {
			t.Parallel()
			if got := IsPrime(tc.n); got != tc.want {
				t.Errorf("IsPrime(%d) = %v; want %v", tc.n, got, tc.want)
			}
		})
	}
}

// -----------------------------------------------------------------------------
// Nested subtests — groups within groups.
// -----------------------------------------------------------------------------

func TestDivisionGrouped(t *testing.T) {
	t.Run("ok", func(t *testing.T) {
		t.Run("simple", func(t *testing.T) {
			q, _ := Div(10, 2)
			if q != 5 {
				t.Fail()
			}
		})
		t.Run("negative", func(t *testing.T) {
			q, _ := Div(-10, 2)
			if q != -5 {
				t.Fail()
			}
		})
	})
	t.Run("errors", func(t *testing.T) {
		t.Run("by_zero", func(t *testing.T) {
			if _, err := Div(1, 0); err == nil {
				t.Fail()
			}
		})
	})
}
