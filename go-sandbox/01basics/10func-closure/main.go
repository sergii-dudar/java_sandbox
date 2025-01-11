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

// --------------------------------------Simple Closure

func example1() {
	
	updateCounter := func() func() int {
		// define a local variable inside the function
		count := 100
		return func() int {
			count++
			return count
		}
	}

	// Now, creating a closure
	increment := updateCounter()

	// Using (calling) the closure
	fmt.Println(increment())
	fmt.Println(increment())
	fmt.Println(increment())
}

// --------------------------------------Passing Values into Closures

func example2() {
	
	// Define an outer function that accepts a value
	updateCounter := func(initial int) func() int {
		count := initial // Initialize count with the passed value
		return func() int {
			count++
			return count
		}
	}

	// Create a closure with an initial value
	inc_x := updateCounter(100)

	// Use the closure
	fmt.Println(inc_x())
	fmt.Println(inc_x())

	// Create another closure with an initial value
	inc_y := updateCounter(200)

	// Use the closure
	fmt.Println(inc_y())
	fmt.Println(inc_y())
}

// --------------------------------------

func example3() {
	
}

// --------------------------------------

func example4() {
	
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
