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
