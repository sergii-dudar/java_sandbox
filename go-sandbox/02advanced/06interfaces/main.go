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
}

// --------------------------------------

/* define an interface */
type Shape interface {
	area() float64
}

/* define a circle */
type Circle struct {
	x, y, radius float64
}

/* define a rectangle */
type Rectangle struct {
	width, height float64
}

/* define a method for circle (implementation of Shape.area())*/
func (circle Circle) area() float64 {
	return math.Pi * circle.radius * circle.radius
}

/* define a method for rectangle (implementation of Shape.area())*/
func (rect Rectangle) area() float64 {
	return rect.width * rect.height
}

/* define a method for shape */
func getArea(shape Shape) float64 {
	return shape.area()
}

func example1() {
	
	circle := Circle{x: 0, y: 0, radius: 5}
	rectangle := Rectangle{width: 10, height: 5}

	fmt.Printf("Circle area: %f\n", getArea(circle))
	fmt.Printf("Rectangle area: %f\n", getArea(rectangle))
}

// --------------------------------------

func example2() {
	
	c1 := car{"suzuki", "blue"}
	t1 := toyota{"Toyota", "Red", 100}
	c1.accelerate()
	t1.accelerate()
	foo(c1)
	foo(t1)
}

type vehicle interface {
	accelerate()
}

func foo(v vehicle) {
	fmt.Println(v)
}

type car struct {
	model string
	color string
}

func (c car) accelerate() {
	fmt.Println("Accelrating?")
}

type toyota struct {
	model string
	color string
	speed int
}

func (t toyota) accelerate() {
	fmt.Println("I am toyota, I accelerate fast?")
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
