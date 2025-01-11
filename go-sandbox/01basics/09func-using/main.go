package main

import (
	"fmt"
	"math"
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
}

// --------------------------------------Call by Value

func example1() {
	
	var a int = 100
	var b int = 200

	fmt.Printf("Before swap, value of a : %d\n", a)
	fmt.Printf("Before swap, value of b : %d\n", b)

	/* calling a function to swap the values */
	swap(a, b)

	fmt.Printf("After swap, value of a : %d\n", a)
	fmt.Printf("After swap, value of b : %d\n", b)
}

func swap(x, y int) int {
	var temp int

	temp = x /* save the value of x */
	x = y    /* put y into x */
	y = temp /* put temp into y */

	return temp
}

// --------------------------------------

func example2() {
	
	student := Student{name: "Reese Witherspoon", age: 23, grade: "A"}
	fmt.Println("Student data before function call:\n", student)

	// Call by value
	changeStudentData(student)

	fmt.Println("Student data after function call:\n", student)
}

type Student struct {
	name  string
	age   int
	grade string
}

// Function to change the student data
func changeStudentData(s Student) {
	s.name = "Prakash Joshi"
	s.age = 21
	s.grade = "B"
	fmt.Println("Student Data Inside changeStudentData():\n", s)
}

// --------------------------------------Call by reference

func example3() {
	
	/* local variable definition */
	var a int = 100
	var b int = 200

	fmt.Printf("Before swap, value of a : %d\n", a)
	fmt.Printf("Before swap, value of b : %d\n", b)

	/* calling a function to swap the values.
	 * &a indicates pointer to a ie. address of variable a and
	 * &b indicates pointer to b ie. address of variable b.
	 */
	swapRef(&a, &b)

	fmt.Printf("After swap, value of a : %d\n", a)
	fmt.Printf("After swap, value of b : %d\n", b)
}

func swapRef(x *int, y *int) {
	var temp int
	temp = *x /* save the value at address x */
	*x = *y   /* put y into x */
	*y = temp /* put temp into y */
}

// --------------------------------------

func example4() {
	
	student := Student{name: "Reese Witherspoon", age: 23, grade: "A"}
	fmt.Println("Student data before function call:\n", student)

	// Call by reference
	changeStudentDataRef(&student)

	fmt.Println("Student data after function call:\n", student)
}

// Function to change the student data using a pointer
func changeStudentDataRef(s *Student) {
	s.name = "Prakash Joshi"
	s.age = 21
	s.grade = "B"
	fmt.Println("Student Data Inside changeStudentData():\n", *s)
}

// --------------------------------------Functions as Values

func example5() {
	

	/* declare a function variable */
	getSquareRoot := func(x float64) float64 {
		return math.Sqrt(x)
	}

	/* use the function */
	fmt.Println(getSquareRoot(9))
}

// --------------------------------------Assigning a Function to a Variable

func example6() {
	
	// Assign the function to a variable
	sum := addTwoNumbers

	// Here, we are calling the function
	// using the variable
	result := sum(100, 200)
	fmt.Println("Sum:", result)
}

func addTwoNumbers(a int, b int) int {
	return a + b
}

// --------------------------------------Passing a Function as an Argument

func example7() {
	
	result := calculation(2, 5, multiplyNumbers)
	fmt.Println("Result:", result)
}

// Passing a Function as an Argument
func calculation(x int, y int, op func(int, int) int) int {
	return op(x, y)
}

func multiplyNumbers(x int, y int) int {
	return x * y
}

// --------------------------------------Returning a Function as a Value

func example8() {
	
	multiplyByTwo := calculationRet(2)
	result := multiplyByTwo(20)
	fmt.Println("Result:", result)
}

func calculationRet(factor int) func(int) int {
	return func(value int) int {
		return factor * value
	}
}
