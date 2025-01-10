package main

import (
	"fmt"
	"strings"
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

// --------------------------------------Global Variables
var a int = 20

func example1() {
	
	/* local variable declaration in main function */
	var a int = 10
	var b int = 20
	var c int = 0

	fmt.Printf("value of a in main() = %d\n", a)
	c = sum(a, b)
	fmt.Printf("value of c in main() = %d\n", c)
}

func sum(a, b int) int {
	fmt.Printf("value of a in sum() = %d\n", a)
	fmt.Printf("value of b in sum() = %d\n", b)

	return a + b
}

// --------------------------------------

func example2() {
	
	greeting := "Hello world!"

	fmt.Printf("normal string: ")
	fmt.Printf("%s", greeting)
	fmt.Printf("\n")
	fmt.Printf("hex bytes: ")

	for i := 0; i < len(greeting); i++ {
		fmt.Printf("%x ", greeting[i])
	}

	fmt.Printf("\n")
	const sampleText = "\xbd\xb2\x3d\xbc\x20\xe2\x8c\x98"

	/*q flag escapes unprintable characters, with + flag it escapses non-ascii
	  characters as well to make output unambigous */
	fmt.Printf("quoted string: ")
	fmt.Printf("%+q", sampleText)
	fmt.Printf("\n")
}

// --------------------------------------Concatenating Strings

func example3() {
	
	greetings := []string{"Hello", "world!"}
	fmt.Println(strings.Join(greetings, " "))
}

// --------------------------------------Arrays

func example4() {
	
	var n [10]int /* n is an array of 10 integers */
	var i, j int

	/* initialize elements of array n to 0 */
	for i = 0; i < 10; i++ {
		n[i] = i + 100 /* set element at location i to i + 100 */
	}

	/* output each array element's value */
	for j = 0; j < 10; j++ {
		fmt.Printf("Element[%d] = %d\n", j, n[j])
	}
}

// --------------------------------------Multidimensional Arrays

func example5() {
	
	/* an array with 5 rows and 2 columns*/
	a := [5][2]int{{0, 0}, {1, 2}, {2, 4}, {3, 6}, {4, 8}}
	var i, j int

	/* output each array element's value */
	for i = 0; i < 5; i++ {
		for j = 0; j < 2; j++ {
			fmt.Printf("a[%d][%d] = %d\n", i, j, a[i][j])
		}
	}
}

// --------------------------------------Passing arrays to functions

func example6() {
	
	/* an int array with 5 elements */
	balance := []int{1000, 2, 3, 17, 50}
	var avg float32

	/* pass array as an argument */
	avg = getAverage(balance, 5)

	/* output the returned value */
	fmt.Printf("Average value is: %f ", avg)
}

func getAverage(arr []int, size int) float32 {
	var i, sum int
	var avg float32

	for i = 0; i < size; i++ {
		sum += arr[i]
	}

	avg = float32(sum / size)
	return avg
}

// --------------------------------------

func example7() {
	
}
