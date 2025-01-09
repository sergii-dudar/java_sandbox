package main

import (
	"fmt"
	"strings"
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

// --------------------------------------

func example1() {
	fmt.Printf(">>>Example1: \n")
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
	fmt.Printf(">>>Example2: \n")
	str := "I,love,my,country"
	var arr []string = strings.Split(str, ",")
	fmt.Println(len(arr))
	for i, v := range arr {
		fmt.Println("Index : ", i, "value : ", v)
	}
}

// --------------------------------------

func example3() {
	fmt.Printf(">>>Example3: \n")
	fmt.Printf("%q\n", strings.Split("x,y,z", ","))
	fmt.Printf("%q\n", strings.Split(" John and Jack and Johnny and Jinn ", "and"))
	fmt.Printf("%q\n", strings.Split(" abc ", ""))
	fmt.Printf("%q\n", strings.Split("", "Hello"))
}

// --------------------------------------

func example4() {
	fmt.Printf(">>>Example4: \n")
	fmt.Println(strings.ContainsAny("Hello", "A"))
	fmt.Println(strings.ContainsAny("Hello", "o & e"))
	fmt.Println(strings.ContainsAny("Hello", ""))
	fmt.Println(strings.ContainsAny("", ""))
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
