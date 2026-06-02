package math

import "testing"

// -----------------------------------------------------------------------------
// Built-in fuzz tests (Go 1.18+). Run with:
//   go test -fuzz=FuzzAddCommutative -fuzztime=10s ./math
// Without -fuzz, this just runs the seed corpus as a regular subtest.
// -----------------------------------------------------------------------------

func FuzzAddCommutative(f *testing.F) {
	// Seed corpus
	f.Add(0, 0)
	f.Add(1, 2)
	f.Add(-7, 9)
	f.Fuzz(func(t *testing.T, a, b int) {
		if Add(a, b) != Add(b, a) {
			t.Errorf("Add not commutative for (%d,%d)", a, b)
		}
	})
}

func FuzzGCDDivides(f *testing.F) {
	f.Add(54, 24)
	f.Add(17, 5)
	f.Fuzz(func(t *testing.T, a, b int) {
		if a <= 0 || b <= 0 {
			t.Skip()
		}
		g := GCD(a, b)
		if g < 1 || a%g != 0 || b%g != 0 {
			t.Errorf("gcd(%d,%d)=%d not a divisor of both", a, b, g)
		}
	})
}

func FuzzDivNoCrash(f *testing.F) {
	f.Add(10, 3)
	f.Add(-1, 7)
	f.Fuzz(func(t *testing.T, a, b int) {
		// Should never panic — division-by-zero is returned as an error.
		_, _ = Div(a, b)
	})
}
