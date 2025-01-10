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

// --------------------------------------

func example1() {
	
	str := "I love my country"
	fmt.Println(len(str))
	fmt.Println("Ascii value of A is ", "A"[0])
	fmt.Println(strings.ToUpper(str))
	fmt.Println(strings.ToLower(str))
	fmt.Println(strings.HasPrefix(str, "IN"))
	fmt.Println(strings.HasSuffix(str, "IA"))

	arr := []string{"a", "b", "c", "d"}
	fmt.Println(strings.Join(arr, "*"))

	str = "New "
	fmt.Println(strings.Repeat(str, 4))

	str = "Hi...there"
	fmt.Println(strings.Contains(str, "th"))
	fmt.Println(strings.Index(str, "th"))
	fmt.Println(strings.Count(str, "e"))
	fmt.Println(strings.Replace(str, "e", "Z", 2))
	fmt.Println(strings.TrimSpace(" \t\n I love my country  \n\t\r\n"))

	fmt.Println(strings.Compare("a", "b"))
	fmt.Println(strings.Compare("a", "a"))
	fmt.Println(strings.Compare("b", "a"))
}

// --------------------------------------

func example2() {
	
	str := "I,love,my,country"
	var arr []string = strings.Split(str, ",")
	fmt.Println(len(arr))
	for i, v := range arr {
		fmt.Println("Index : ", i, "value : ", v)
	}
}

// --------------------------------------

func example3() {
	
	fmt.Printf("%q\n", strings.Split("x,y,z", ","))
	fmt.Printf("%q\n", strings.Split(" John and Jack and Johnny and Jinn ", "and"))
	fmt.Printf("%q\n", strings.Split(" abc ", ""))
	fmt.Printf("%q\n", strings.Split("", "Hello"))
}

// --------------------------------------

func example4() {
	
	fmt.Println(strings.ContainsAny("Hello", "A"))
	fmt.Println(strings.ContainsAny("Hello", "o & e"))
	fmt.Println(strings.ContainsAny("Hello", ""))
	fmt.Println(strings.ContainsAny("", ""))
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
