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
}

func example1() {
	var a int = 21
	var b int = 10
	var c int

	c = a + b
	fmt.Printf("Line 1 - Value of c is %d\n", c)

	c = a - b
	fmt.Printf("Line 2 - Value of c is %d\n", c)

	c = a * b
	fmt.Printf("Line 3 - Value of c is %d\n", c)

	c = a / b
	fmt.Printf("Line 4 - Value of c is %d\n", c)

	c = a % b
	fmt.Printf("Line 5 - Value of c is %d\n", c)

	a++
	fmt.Printf("Line 6 - Value of a is %d\n", a)

	a--
	fmt.Printf("Line 7 - Value of a is %d\n", a)
}

func example2() {
	var a int = 21
	var c int

	c = a
	fmt.Printf("Line 1 - =  Operator Example, Value of c = %d\n", c)

	c += a
	fmt.Printf("Line 2 - += Operator Example, Value of c = %d\n", c)

	c -= a
	fmt.Printf("Line 3 - -= Operator Example, Value of c = %d\n", c)

	c *= a
	fmt.Printf("Line 4 - *= Operator Example, Value of c = %d\n", c)

	c /= a
	fmt.Printf("Line 5 - /= Operator Example, Value of c = %d\n", c)

	c = 200

	c <<= 2
	fmt.Printf("Line 6 - <<= Operator Example, Value of c = %d\n", c)

	c >>= 2
	fmt.Printf("Line 7 - >>= Operator Example, Value of c = %d\n", c)

	c &= 2
	fmt.Printf("Line 8 - &= Operator Example, Value of c = %d\n", c)

	c ^= 2
	fmt.Printf("Line 9 - ^= Operator Example, Value of c = %d\n", c)

	c |= 2
	fmt.Printf("Line 10 - |= Operator Example, Value of c = %d\n", c)
}

func example3() {
	var a int = 21
	var b int = 10

	if a == b {
		fmt.Printf("Line 1 - a is equal to b\n")
	} else {
		fmt.Printf("Line 1 - a is not equal to b\n")
	}
	if a < b {
		fmt.Printf("Line 2 - a is less than b\n")
	} else {
		fmt.Printf("Line 2 - a is not less than b\n")
	}
	if a > b {
		fmt.Printf("Line 3 - a is greater than b\n")
	} else {
		fmt.Printf("Line 3 - a is not greater than b\n")
	}

	/* Lets change value of a and b */
	a = 5
	b = 20
	if a <= b {
		fmt.Printf("Line 4 - a is either less than or equal to  b\n")
	}
	if b >= a {
		fmt.Printf("Line 5 - b is either greater than  or equal to b\n")
	}
}

func example4() {
	var a bool = true
	var b bool = false
	if a && b {
		fmt.Printf("Line 1 - Condition is true\n")
	}
	if a || b {
		fmt.Printf("Line 2 - Condition is true\n")
	}

	/* lets change the value of  a and b */
	a = false
	b = true
	if a && b {
		fmt.Printf("Line 3 - Condition is true\n")
	} else {
		fmt.Printf("Line 3 - Condition is not true\n")
	}
	if !(a && b) {
		fmt.Printf("Line 4 - Condition is true\n")
	}
}

func example5() {
	var a uint = 60 /* 60 = 0011 1100 */
	var b uint = 13 /* 13 = 0000 1101 */
	var c uint = 0

	c = a & b /* 12 = 0000 1100 */
	fmt.Printf("Line 1 - Value of c is %d\n", c)

	c = a | b /* 61 = 0011 1101 */
	fmt.Printf("Line 2 - Value of c is %d\n", c)

	c = a ^ b /* 49 = 0011 0001 */
	fmt.Printf("Line 3 - Value of c is %d\n", c)

	c = a << 2 /* 240 = 1111 0000 */
	fmt.Printf("Line 4 - Value of c is %d\n", c)

	c = a >> 2 /* 15 = 0000 1111 */
	fmt.Printf("Line 5 - Value of c is %d\n", c)
}

func example6() {
	var a int = 4
	var b int32
	var c float32
	var ptr *int

	/* example of type operator */
	fmt.Printf("Line 1 - Type of variable a = %T\n", a)
	fmt.Printf("Line 2 - Type of variable b = %T\n", b)
	fmt.Printf("Line 3 - Type of variable c= %T\n", c)

	/* example of & and * operators */
	ptr = &a /* 'ptr' now contains the address of 'a'*/
	fmt.Printf("value of a is  %d\n", a)
	fmt.Printf("*ptr is %d.\n", *ptr)
}

func example7() {
	var a int = 20
	var b int = 10
	var c int = 15
	var d int = 5
	var e int

	e = (a + b) * c / d // ( 30 * 15 ) / 5
	fmt.Printf("Value of (a + b) * c / d is : %d\n", e)

	e = ((a + b) * c) / d // (30 * 15 ) / 5
	fmt.Printf("Value of ((a + b) * c) / d is  : %d\n", e)

	e = (a + b) * (c / d) // (30) * (15/5)
	fmt.Printf("Value of (a + b) * (c / d) is  : %d\n", e)

	e = a + (b*c)/d //  20 + (150/5)
	fmt.Printf("Value of a + (b * c) / d is  : %d\n", e)
}