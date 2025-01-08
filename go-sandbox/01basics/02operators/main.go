package main

import "fmt"

func main() {
	example1()
	fmt.Print("\n\n")
	example2()
	fmt.Print("\n\n")
	example3()
	fmt.Print("\n\n")
	example4()
	fmt.Print("\n\n")
	example5()
	fmt.Print("\n\n")
	example6()
	fmt.Print("\n\n")
	example7()
}

func example1() {
	var a, b int = 10, 5

	// Addition
	sum := a + b
	fmt.Println("Sum:", sum)

	// Subtraction
	difference := a - b
	fmt.Println("Difference:", difference)

	// Multiplication
	product := a * b
	fmt.Println("Product:", product)

	// Division
	quotient := a / b
	fmt.Println("Quotient:", quotient)
}

func example2() {
	var a, b int = 10, 5

	// Equal to
	fmt.Println(a == b)

	// Not equal to
	fmt.Println(a != b)

	// Greater than
	fmt.Println(a > b)

	// Less than
	fmt.Println(a < b)

	// Greater than or equal to
	fmt.Println(a >= b)

	// Less than or equal to
	fmt.Println(a <= b)
}

func example3() {
	var a, b bool = true, false

	// Logical AND (&&)
	fmt.Println(a && b)

	// Logical OR (||)
	fmt.Println(a || b)

	// Logical NOT (!)
	fmt.Println(!a)
}

func example4() {
	var a, b int = 5, 3

	// Bitwise AND
	fmt.Println(a & b)

	// Bitwise OR
	fmt.Println(a | b)

	// Bitwise XOR
	fmt.Println(a ^ b)

	// Bitwise AND NOT
	fmt.Println(a &^ b)

	// Left shift
	fmt.Println(a << 1)

	// Right shift
	fmt.Println(a >> 1)
}

func example5() {
	var a, b int = 10, 5

	// Simple assignment
	a = b
	fmt.Println("a =", a)

	// Add and assign
	a += b
	fmt.Println("a += b:", a)

	// Subtract and assign
	a -= b
	fmt.Println("a -= b:", a)

	// Multiply and assign
	a *= b
	fmt.Println("a *= b:", a)

	// Divide and assign
	a /= b
	fmt.Println("a /= b:", a)

	// Modulo and assign
	a %= b
	fmt.Println("a %= b:", a)

	// Bitwise AND and assign
	a = 10 // Reset a
	a &= b
	fmt.Println("a &= b:", a)

	// Bitwise OR and assign
	a = 10 // Reset a
	a |= b
	fmt.Println("a |= b:", a)

	// Bitwise XOR and assign
	a = 10 // Reset a
	a ^= b
	fmt.Println("a ^= b:", a)

	// Left shift and assign
	a = 10 // Reset a
	a <<= 1
	fmt.Println("a <<= 1:", a)

	// Right shift and assign
	a = 10 // Reset a
	a >>= 1
	fmt.Println("a >>= 1:", a)
}

func example6() {
}

func example7() {
}
