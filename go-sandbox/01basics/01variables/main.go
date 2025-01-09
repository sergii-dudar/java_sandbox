package main

import (
	"fmt"
	"reflect"
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

func example1() {
	var x float64 = 20.0

	y := 42
	fmt.Println(x)
	fmt.Println(y)
	fmt.Printf("x is of type %T\n", x)
	fmt.Printf("y is of type %T\n", y)
}

func example2() {
	a, b, c := 3, 4, "foo"

	fmt.Println(a)
	fmt.Println(b)
	fmt.Println(c)
	fmt.Printf("a is of type %T\n", a)
	fmt.Printf("b is of type %T\n", b)
	fmt.Printf("c is of type %T\n", c)
}

func example3() {
	const LENGTH int = 10
	const WIDTH int = 5
	var area int = LENGTH * WIDTH
	fmt.Printf("value of area : %d", area)
}

const (
	LuckyNumber = 123
	WelcomeMsg  = "Hey, H! How're You?"
)

func example4() {
	fmt.Println("LuckyNumber:", LuckyNumber)
	fmt.Println("WelcomeMsg:", WelcomeMsg)
}

func example5() {
	// Type Conversion
	var sum int = 17
	var count int = 5
	var mean float32

	mean = float32(sum) / float32(count)
	fmt.Printf("Value of mean : %f\n", mean)
}

func example6() {
	// Reflect
	age := 27.5
	fmt.Printf("%T\n", age)
	fmt.Println(reflect.TypeOf(age))
}

func example7() {
	// go rune
	rune := 'A'
	fmt.Printf("%d \n", rune)
	fmt.Println(reflect.TypeOf(rune))
}
