package main

import "fmt"

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
	fmt.Print("\n\n")
	example9()
	fmt.Print("\n\n")
	example10()
}

// --------------------------------------Defining a slice

func example1() {
	fmt.Printf(">>>Example1: \n")
	numbers := make([]int, 3, 5)
	printSlice(numbers)

	fmt.Printf("\n")
	var numbers1 []int
	printSlice(numbers1)

	if numbers1 == nil {
		fmt.Printf("slice is nil")
	}
}

func printSlice(x []int) {
	fmt.Printf("len=%d cap=%d slice=%v\n", len(x), cap(x), x)
}

// --------------------------------------Subslicing

func example2() {
	fmt.Printf(">>>Example2: \n")
	/* create a slice */
	numbers := []int{0, 1, 2, 3, 4, 5, 6, 7, 8}
	printSlice(numbers)

	/* print the original slice */
	fmt.Println("numbers ==", numbers)

	/* print the sub slice starting from index 1(included) to index 4(excluded)*/
	fmt.Println("numbers[1:4] ==", numbers[1:4])

	/* missing lower bound implies 0*/
	fmt.Println("numbers[:3] ==", numbers[:3])

	/* missing upper bound implies len(s)*/
	fmt.Println("numbers[4:] ==", numbers[4:])

	numbers1 := make([]int, 0, 5)
	printSlice(numbers1)

	/* print the sub slice starting from index 0(included) to index 2(excluded) */
	number2 := numbers[:2]
	printSlice(number2)

	/* print the sub slice starting from index 2(included) to index 5(excluded) */
	number3 := numbers[2:5]
	printSlice(number3)
}

// --------------------------------------append() and copy()

func example3() {
	fmt.Printf(">>>Example3: \n")
	var numbers []int
	printSlice(numbers)

	/* append allows nil slice */
	numbers = append(numbers, 0)
	printSlice(numbers)

	/* add one element to slice*/
	numbers = append(numbers, 1)
	printSlice(numbers)

	/* add more than one element at a time*/
	numbers = append(numbers, 2, 3, 4)
	printSlice(numbers)

	/* create a slice numbers1 with double the capacity of earlier slice*/
	numbers1 := make([]int, len(numbers), (cap(numbers))*2)

	/* copy content of numbers to numbers1 */
	copy(numbers1, numbers)
	printSlice(numbers1)
}

// --------------------------------------for Range

func example4() {
	fmt.Printf(">>>Example4: \n")
	/* create a slice */
	numbers := []int{0, 1, 2, 3, 4, 5, 6, 7, 8}

	/* print the numbers */
	for i := range numbers {
		fmt.Println("Slice item", i, "is", numbers[i])
	}
	fmt.Printf("\n")

	/* create a map*/
	countryCapitalMap := map[string]string{"France": "Paris", "Italy": "Rome", "Japan": "Tokyo"}

	/* print map using keys*/
	for country := range countryCapitalMap {
		fmt.Println("Capital of", country, "is", countryCapitalMap[country])
	}

	fmt.Printf("\n")
	/* print map using key-value*/
	for country, capital := range countryCapitalMap {
		fmt.Println("Capital of", country, "is", capital)
	}
}

// --------------------------------------

func example5() {
	fmt.Printf(">>>Example5: \n")
	odd := [6]int{2, 4, 6, 8, 10, 12}
	var s []int = odd[1:4]
	fmt.Println(s)
}

// --------------------------------------

func example6() {
	fmt.Printf(">>>Example6: \n")
	names := [4]string{
		"John",
		"Jim",
		"Jack",
		"jen",
	}
	fmt.Println(names)
	slice1 := names[0:2]
	slice2 := names[1:3]
	fmt.Println(slice1, slice2)
	slice2[0] = "ZZZ"
	fmt.Println(slice1, slice2)
	fmt.Println(names)
}

// --------------------------------------

func example7() {
	fmt.Printf(">>>Example7: \n")
	s := []struct {
		i int
		b bool
	}{
		{1, true},
		{2, false},
		{3, true},
		{4, true},
		{5, false},
		{6, true},
	}
	fmt.Println(s)
}

func example8() {
	slice1 := []int{2, 4, 8, 10, 12, 14}
	slice2 := slice1[2:4]
	fmt.Println(slice2)
	slice3 := slice1[:3]
	fmt.Println(slice3)
	slice4 := slice1[2:]
	fmt.Println(slice4)
	fmt.Println(slice1)
}

func example9() {
	slice1 := []int{2, 4, 6, 8, 10, 12, 14}
	printSlice(slice1)
	// Slice the slice to give it zero length.
	slice2 := slice1[:0]
	printSlice(slice2)
	// Extend its length.
	slice3 := slice1[:4]
	printSlice(slice3)
	// Drop its first two values.
	slice4 := slice1[2:]
	printSlice(slice4)
}

func example10() {
	slice := make([]int, 10)
	printSlice2("slice", slice)
	slice1 := make([]int, 0, 10)
	printSlice2("slice1", slice1)
	slice2 := slice1[:5]
	printSlice2("slice2", slice2)
	slice3 := slice2[2:5]
	printSlice2("slice3", slice3)
}

func printSlice2(s string, x []int) {
	fmt.Printf("%s length=%d capacity=%d %v\n",
		s, len(x), cap(x), x)
}
