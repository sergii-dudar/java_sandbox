package main

import (
	"fmt"
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
	fmt.Println("\n>>>>>--------------EXAMPLE8--------------<<<<<")
	example8()
	fmt.Println("\n>>>>>--------------EXAMPLE9--------------<<<<<")
	example9()
}

func example1() {
	var a int = 10

	/* check the boolean condition using if statement */
	if a < 20 {
		/* if condition is true then print the following */
		fmt.Printf("a is less than 20\n")
	}
	fmt.Printf("value of a is : %d\n", a)

	//--
	var num int
	num = -10

	if num > 0 {
		fmt.Println("The number is positive.")
	}
	if num < 0 {
		fmt.Println("The number is negative.")
	}
	if num == 0 {
		fmt.Println("The number is zero.")
	}
}

func example2() {
	/* local variable definition */
	var a int = 100

	/* check the boolean condition */
	if a < 20 {
		/* if condition is true then print the following */
		fmt.Printf("a is less than 20\n")
	} else {
		/* if condition is false then print the following */
		fmt.Printf("a is not less than 20\n")
	}
	fmt.Printf("value of a is : %d\n", a)
}

func example3() {
	/* local variable definition */
	var a int = 100

	/* check the boolean condition */
	if a == 10 {
		/* if condition is true then print the following */
		fmt.Printf("Value of a is 10\n")
	} else if a == 20 {
		/* if else if condition is true */
		fmt.Printf("Value of a is 20\n")
	} else if a == 30 {
		/* if else if condition is true  */
		fmt.Printf("Value of a is 30\n")
	} else {
		/* if none of the conditions is true */
		fmt.Printf("None of the values is matching\n")
	}
	fmt.Printf("Exact value of a is: %d\n", a)
}

func example4() {
	/* local variable definition */
	var a int = 100
	var b int = 200

	/* check the boolean condition */
	if a == 100 {
		/* if condition is true then check the following */
		if b == 200 {
			/* if condition is true then print the following */
			fmt.Printf("Value of a is 100 and b is 200\n")
		}
	}
	fmt.Printf("Exact value of a is : %d\n", a)
	fmt.Printf("Exact value of b is : %d\n", b)
}

func example5() {
	// An int array
	arr := []int{10, 20, 55, 53, 75, 80}

	for _, num := range arr {
		if num > 20 {
			if num%2 == 0 {
				fmt.Println("Even number found, breaking loop.")
				break
			} else {
				fmt.Printf("Odd number > 20: %d\n", num)
			}
		}
	}

	fmt.Println("End of loop.")
}

func example6() {
	var grade string = "B"
	var marks int = 90

	switch marks {
	case 90:
		grade = "A"
	case 80:
		grade = "B"
	case 50, 60, 70:
		grade = "C"
	default:
		grade = "D"
	}
	switch {
	case grade == "A":
		fmt.Printf("Excellent!\n")
	case grade == "B", grade == "C":
		fmt.Printf("Well done\n")
	case grade == "D":
		fmt.Printf("You passed\n")
	case grade == "F":
		fmt.Printf("Better try again\n")
	default:
		fmt.Printf("Invalid grade\n")
	}
	fmt.Printf("Your grade is  %s\n", grade)
}

func example7() {
	var x interface{}

	switch i := x.(type) {
	case nil:
		fmt.Printf("type of x :%T", i)
	case int:
		fmt.Printf("x is int")
	case float64:
		fmt.Printf("x is float64")
	case func(int) float64:
		fmt.Printf("x is func(int)")
	case bool, string:
		fmt.Printf("x is bool or string")
	default:
		fmt.Printf("don't know the type")
	}
}

func example8() {
}

func example9() {
}