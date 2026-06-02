package math

import (
	"os"
	"testing"
)

// TestMain runs once for the whole package. Use it for setup/teardown
// (e.g., spin up a test DB) before tests execute.
func TestMain(m *testing.M) {
	// setup goes here
	code := m.Run()
	// teardown goes here
	os.Exit(code)
}

// -----------------------------------------------------------------------------
// Plain tests (the simplest form: `func TestXxx(t *testing.T)`)
// -----------------------------------------------------------------------------

func TestAdd(t *testing.T) {
	if got := Add(2, 3); got != 5 {
		t.Errorf("Add(2,3) = %d; want 5", got)
	}
}

func TestSub(t *testing.T) {
	if got := Sub(10, 4); got != 6 {
		t.Errorf("Sub(10,4) = %d; want 6", got)
	}
}

func TestMul(t *testing.T) {
	if got := Mul(6, 7); got != 42 {
		t.Errorf("Mul(6,7) = %d; want 42", got)
	}
}

func TestDivOK(t *testing.T) {
	got, err := Div(20, 4)
	if err != nil || got != 5 {
		t.Fatalf("Div(20,4) = %d, %v; want 5, nil", got, err)
	}
}

func TestDivByZero(t *testing.T) {
	if _, err := Div(1, 0); err == nil {
		t.Fatal("Div(1,0) should error")
	}
}

// -----------------------------------------------------------------------------
// t.Skip / t.SkipNow — produces a SKIP outcome (parser-visible).
// -----------------------------------------------------------------------------

func TestSkippedExplicitly(t *testing.T) {
	t.Skip("demonstration of a skipped test")
}

func TestSkippedConditionally(t *testing.T) {
	if testing.Short() {
		t.Skip("skipped in -short mode")
	}
	// Pretend this is a long test.
	if Fibonacci(20) != 6765 {
		t.Fatal("fib(20) mismatch")
	}
}

// -----------------------------------------------------------------------------
// t.Cleanup — registers teardown that runs when the test ends.
// -----------------------------------------------------------------------------

func TestWithCleanup(t *testing.T) {
	t.Cleanup(func() { t.Log("cleanup ran") })
	if GCD(54, 24) != 6 {
		t.Fatal("gcd mismatch")
	}
}

// -----------------------------------------------------------------------------
// Helper marked with t.Helper() — file/line in failures points to caller.
// -----------------------------------------------------------------------------

func assertEqual(t *testing.T, got, want int) {
	t.Helper()
	if got != want {
		t.Errorf("got %d, want %d", got, want)
	}
}

func TestUsingHelper(t *testing.T) {
	assertEqual(t, Factorial(5), 120)
	assertEqual(t, Factorial(0), 1)
}
