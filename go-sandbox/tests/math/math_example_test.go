package math_test

import (
	"fmt"

	"sandbox-tests/math"
)

// Examples are tests verified by comparing the function's standard output
// to the `// Output:` comment. They also appear in godoc.

func ExampleAdd() {
	fmt.Println(math.Add(2, 3))
	// Output: 5
}

func ExampleFactorial() {
	fmt.Println(math.Factorial(5))
	// Output: 120
}

func ExampleFibonacci_sequence() {
	for i := 0; i < 8; i++ {
		fmt.Printf("%d ", math.Fibonacci(i))
	}
	// Output: 0 1 1 2 3 5 8 13
}

// Unordered output — lines may appear in any order.
func ExampleGCD_unordered() {
	fmt.Println(math.GCD(54, 24))
	fmt.Println(math.GCD(17, 5))
	// Unordered output:
	// 1
	// 6
}
