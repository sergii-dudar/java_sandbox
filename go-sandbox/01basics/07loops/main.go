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
	fmt.Println("\n>>>>>--------------EXAMPLE8--------------<<<<<")
	example8()
}

func example1() {
	// Print numbers from 1 to 10
	for i := 1; i <= 10; i++ {
		fmt.Println(i)
	}
}

func example2() {
	var b int = 15
	var a int
	numbers := [6]int{1, 2, 3, 5}

	/* for loop execution */
	for a := 0; a < 10; a++ {
		fmt.Printf("value of a: %d\n", a)
	}
	for a < b {
		a++
		fmt.Printf("value of a: %d\n", a)
	}
	for i, x := range numbers {
		fmt.Printf("value of x = %d at %d\n", x, i)
	}
}

func example3() {
	str := "TutorialsPoint"

	// Loop through the string by index
	fmt.Println("Characters of the string with their index:")
	for i := 0; i < len(str); i++ {
		fmt.Printf("[%2d]: %c\n", i, str[i])
	}
	// infinity loop
	//     for {
	//     fmt.Println("Hello, World!")
	// }
}

func example4() {
	// Outer loop
	for i := 1; i <= 5; i++ {
		// Inner loop
		for j := 1; j <= i; j++ {
			fmt.Print("*")
		}
		fmt.Println() // prints a new line
	}
}

func example5() {
	var i, j int

	for i = 2; i < 100; i++ {
		for j = 2; j <= (i / j); j++ {
			if i%j == 0 {
				break // if factor found, not prime
			}
		}
		if j > (i / j) {
			fmt.Printf("%d is prime\n", i)
		}
	}
}

func example6() {
	/* local variable definition */
	var a int = 10

	/* for loop execution */
	for a < 20 {
		fmt.Printf("value of a: %d\n", a)
		a++
		if a > 15 {
			/* terminate the loop using break statement */
			break
		}
	}
}

func example7() {
	/* local variable definition */
	var a int = 10

	/* do loop execution */
	for a < 20 {
		if a == 15 {
			/* skip the iteration */
			a = a + 1
			continue
		}
		fmt.Printf("value of a: %d\n", a)
		a++
	}
}

func example8() {
	/* local variable definition */
	var a int = 10

	/* do loop execution */
LOOP:
	for a < 20 {
		if a == 15 {
			/* skip the iteration */
			a = a + 1
			goto LOOP
		}
		fmt.Printf("value of a: %d\n", a)
		a++
	}
}