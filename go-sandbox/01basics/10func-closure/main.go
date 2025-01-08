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

// --------------------------------------Simple Closure

func example1() {
	fmt.Printf(">>>Example6: \n")
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
	fmt.Printf(">>>Example2: \n")
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
	fmt.Printf(">>>Example3: \n")
}

// --------------------------------------

func example4() {
	fmt.Printf(">>>Example4: \n")
}

// --------------------------------------

func example5() {
	fmt.Printf(">>>Example5: \n")
}

// --------------------------------------

func example6() {
	fmt.Printf(">>>Example6: \n")
}

// --------------------------------------

func example7() {
	fmt.Printf(">>>Example7: \n")
}
