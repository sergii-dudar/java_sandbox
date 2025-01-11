package main

import "fmt"

func main() {
	fmt.Println(">>>>>--------------EXAMPLE1--------------<<<<<")
	example1()
	fmt.Println("\n>>>>>--------------EXAMPLE2--------------<<<<<")
	example2()
	fmt.Println("\n>>>>>--------------EXAMPLE3--------------<<<<<")
	example3()
	fmt.Println("\n>>>>>--------------EXAMPLE4--------------<<<<<")
	example4()
	fmt.Println("\n>>>>>--------------EXAMPLE5--------------<<<<<")
	example5()
	fmt.Println("\n>>>>>--------------EXAMPLE6--------------<<<<<")
	example6()
	fmt.Println("\n>>>>>--------------EXAMPLE7--------------<<<<<")
	example7()
}

func example1() {
	var a int = 100
	var b int = 200
	var ret int

	/* calling a function to get max value */
	ret = max(a, b)

	fmt.Printf("Max value is : %d\n", ret)
}

/* function returning the max between two numbers */
func max(num1, num2 int) int {
	/* local variable declaration */
	var result int

	if num1 > num2 {
		result = num1
	} else {
		result = num2
	}
	return result
}

// ---------------------------------
func example2() {
	// Returning Multiple Values from Function
	a, b := swap("Mahesh", "Kumar")
	fmt.Println(a, b)
}

func swap(x, y string) (string, string) {
	return y, x
}

// ---------------------------------
func example3() {
	// Call by Value
	num := 10
	fmt.Println("Before function call, num =", num)

	// Call by value
	updateValue(num)

	fmt.Println("After function call, num =", num)
}

func updateValue(x int) {
	x = x * x
	fmt.Println("Inside updateValue Function, x =", x)
}

// ---------------------------------
func example4() {
	num := 10
	fmt.Println("Before function call, num =", num)

	// Call by value
	updateValueRef(&num)

	fmt.Println("After function call, num =", num)
}

func updateValueRef(x *int) {
	*x = *x * *x
	fmt.Println("Inside updateValue Function, x =", *x)
}

func example5() {
}

func example6() {
}

func example7() {
}