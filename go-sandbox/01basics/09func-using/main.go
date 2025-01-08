package main

import (
	"fmt"
	"math"
)

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
	fmt.Print("\n\n")
	example8()
}

// --------------------------------------Call by Value

func example1() {
	fmt.Printf(">>>Example1: \n")
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
	fmt.Printf(">>>Example2: \n")
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
	fmt.Printf(">>>Example3: \n")
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
	fmt.Printf(">>>Example4: \n")
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
	fmt.Printf(">>>Example5: \n")

	/* declare a function variable */
	getSquareRoot := func(x float64) float64 {
		return math.Sqrt(x)
	}

	/* use the function */
	fmt.Println(getSquareRoot(9))
}

// --------------------------------------Assigning a Function to a Variable

func example6() {
	fmt.Printf(">>>Example6: \n")
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
	fmt.Printf(">>>Example7: \n")
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
	fmt.Printf(">>>Example8: \n")
	multiplyByTwo := calculationRet(2)
	result := multiplyByTwo(20)
	fmt.Println("Result:", result)
}

func calculationRet(factor int) func(int) int {
	return func(value int) int {
		return factor * value
	}
}
