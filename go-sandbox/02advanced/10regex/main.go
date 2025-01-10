package main

import (
	"fmt"
	"regexp"
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

func example1() {
	
	re := regexp.MustCompile(".com")
	fmt.Println(re.FindString("google.com"))
	fmt.Println(re.FindString("abc.org"))
	fmt.Println(re.FindString("fb.com"))
}

// --------------------------------------

func example2() {
	
	re := regexp.MustCompile(".com")
	fmt.Println(re.FindStringIndex("google.com"))
	fmt.Println(re.FindStringIndex("abc.org"))
	fmt.Println(re.FindStringIndex("fb.com"))
}

// --------------------------------------

func example3() {
	
	re := regexp.MustCompile("f([a-z]+)ing")
	fmt.Println(re.FindStringSubmatch("flying"))
	fmt.Println(re.FindStringSubmatch("abcfloatingxyz"))
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
