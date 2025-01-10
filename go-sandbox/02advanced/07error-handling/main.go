package main

import (
	"errors"
	"fmt"
	"math"
	"os"
)

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

// --------------------------------------

func example1() {
	
	result, err := Sqrt(-1)

	if err != nil {
		fmt.Println(err)
	} else {
		fmt.Println(result)
	}

	result, err = Sqrt(9)

	if err != nil {
		fmt.Println(err)
	} else {
		fmt.Println(result)
	}
}

func Sqrt(value float64) (float64, error) {
	if value < 0 {
		return 0, errors.New("Math: negative number passed to Sqrt")
	}
	return math.Sqrt(value), nil
}

// --------------------------------------recover()

func example2() {
	
	fmt.Println(SaveDivide(10, 0))
	fmt.Println(SaveDivide(10, 10))
}

// The defer keyword is generally used for cleaning purpose.
// The defer keyword postpones the execution of a function or
// statement until the end of the calling function.

// It executes code (a function or expression) when the
// enclosing function returns before the closing
// curly brace }. It is also executed if an error occurs
// during the execution of the enclosing function.

func SaveDivide(num1, num2 int) int {
	defer func() {
		fmt.Println(recover())
	}()
	quotient := num1 / num2
	return quotient
}

// --------------------------------------Panic

// Go panic is a mechanism by which we handle error situations. Panic can be used to abort a function execution.
// When a function calls panic, its execution stops and the control flows to the associated deferred function.

// The caller of this function also gets terminated and caller's deferred function gets executed (if present any). This process
// continues till the program terminates. Now the error condition is reported.

// This termination sequences is called panicking and can be controlled by the built-in function recover.

func example3() {
	
	// panic("Error Situation")
	_, err := os.Open("/tmp/file")
	if err != nil {
		panic(err)
	}
}

// --------------------------------------

func example4() {
	
	fmt.Println("Calling x from main.")
	x()
	fmt.Println("Returned from x.")
}

func x() {
	defer func() {
		if r := recover(); r != nil {
			fmt.Println("Recovered in x", r)
		}
	}()
	fmt.Println("Executing x...")
	fmt.Println("Calling y.")
	y(0)
	fmt.Println("Returned normally from y.")
}

func y(i int) {
	fmt.Println("Executing y....")
	if i > 2 {
		fmt.Println("Panicking!")
		panic(fmt.Sprintf("%v", i))
	}
	defer fmt.Println("Defer in y", i)
	fmt.Println("Printing in y", i)
	y(i + 1)
}

// --------------------------------------

func example5() {
	
}

// --------------------------------------

func example6() {
	
}

// --------------------------------------

func example7() {
	
}
