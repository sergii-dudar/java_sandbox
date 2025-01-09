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
}

// --------------------------------------Syntax of a Method

func example1() {
	fmt.Printf(">>>Example1: \n")
	circle := Circle{x: 0, y: 0, radius: 5}
	fmt.Printf("Circle area: %f", circle.area())
}

/* define a circle */
type Circle struct {
	x, y, radius float64
}

/* define a method for circle */
func (circle Circle) area() float64 {
	return math.Pi * circle.radius * circle.radius
}

// --------------------------------------Struct Type Receiver

func example2() {
	fmt.Printf(">>>Example2: \n")
	rectObj := Rectangle{width: 2.4, height: 4.5}
	fmt.Println("Area of Rectangle:", rectObj.Area())
}

// Struct
type Rectangle struct {
	width, height float64
}

// Define a method  with struct type receiver
func (rect Rectangle) Area() float64 {
	return rect.width * rect.height
}

// --------------------------------------Methods with Non-Struct Type Receiver

func example3() {
	// You can also create a method with non-struct type receivers of such type
	// whose definition is present in the same package.
	fmt.Printf(">>>Example3: \n")
	x := value(3)
	y := x.cube()

	fmt.Println("Cube of", x, "is", y)
}

// Creating a custom type based on int
type value int

// Defining a method with a non-struct receiver
func (v value) cube() value {
	return v * v * v
}

// --------------------------------------Methods with Pointer Receiver

func example4() {
	fmt.Printf(">>>Example4: \n")
	// You can create a method that can have pointer receivers. This approach
	// reflects the changes done in the method in the caller.

	s := student{grade: "B"}

	fmt.Println("Before:", s.grade)

	// Calling the method to update the grade
	s.updateGrade("A")

	fmt.Println("After:", s.grade)
}

type student struct {
	grade string
}

// Method with pointer receiver to modify data
func (s *student) updateGrade(newGrade string) {
	s.grade = newGrade
}

// --------------------------------------Recursion in Go

func example5() {
	fmt.Printf(">>>Example5: \n")
	var i int = 15
	fmt.Printf("Factorial of %d is %d", i, factorial(i))
}

func factorial(i int) int {
	if i <= 1 {
		return 1
	}
	return i * factorial(i-1)
}

// --------------------------------------Fibonacci Series Using Recursion

func example6() {
	fmt.Printf(">>>Example6: \n")
	var i int
	for i = 0; i < 10; i++ {
		fmt.Printf("%d ", fibonaci(i))
	}
}

func fibonaci(i int) (ret int) {
	if i == 0 {
		return 0
	}
	if i == 1 {
		return 1
	}
	return fibonaci(i-1) + fibonaci(i-2)
}

// --------------------------------------
// The defer keyword is generally used for cleaning purpose.
// The defer keyword postpones the execution of a function or
// statement until the end of the calling function.

// It executes code (a function or expression) when the
// enclosing function returns before the closing
// curly brace }. It is also executed if an error occurs
// during the execution of the enclosing function.

func example7() {
	fmt.Printf(">>>Example7: \n")

	defer print1("Hi...")
	print2("there")
}

func print1(s string) {
	fmt.Println(s)
}

func print2(s string) {
	fmt.Println(s)
}
