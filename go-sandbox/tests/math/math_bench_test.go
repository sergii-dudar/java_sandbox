package math

import "testing"

// -----------------------------------------------------------------------------
// Benchmarks — `go test -bench=. ./math`. Produces distinct ns/op output.
// -----------------------------------------------------------------------------

func BenchmarkFibonacci10(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = Fibonacci(10)
	}
}

func BenchmarkFibonacci30(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = Fibonacci(30)
	}
}

func BenchmarkFactorial20(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = Factorial(20)
	}
}

func BenchmarkIsPrimeLarge(b *testing.B) {
	for i := 0; i < b.N; i++ {
		_ = IsPrime(1_000_003)
	}
}

// Sub-benchmarks via `b.Run` — analogous to subtests.
func BenchmarkFibonacciSizes(b *testing.B) {
	for _, n := range []int{5, 10, 20, 30} {
		n := n
		b.Run(formatN(n), func(b *testing.B) {
			b.ReportAllocs()
			for i := 0; i < b.N; i++ {
				_ = Fibonacci(n)
			}
		})
	}
}

func formatN(n int) string {
	return "n=" + itoa(n)
}

func itoa(n int) string {
	if n == 0 {
		return "0"
	}
	neg := n < 0
	if neg {
		n = -n
	}
	var out []byte
	for n > 0 {
		out = append([]byte{byte('0' + n%10)}, out...)
		n /= 10
	}
	if neg {
		out = append([]byte{'-'}, out...)
	}
	return string(out)
}
