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
}

// --------------------------------------Defining a Map

func example1() {
	fmt.Printf(">>>Example1: \n")
	var countryCapitalMap map[string]string
	/* create a map*/
	countryCapitalMap = make(map[string]string)

	/* insert key-value pairs in the map*/
	countryCapitalMap["France"] = "Paris"
	countryCapitalMap["Italy"] = "Rome"
	countryCapitalMap["Japan"] = "Tokyo"
	countryCapitalMap["India"] = "New Delhi"

	/* print map using keys*/
	for country := range countryCapitalMap {
		fmt.Println("Capital of", country, "is", countryCapitalMap[country])
	}

	/* test if entry is present in the map or not*/
	capital, ok := countryCapitalMap["United States"]

	/* if ok is true, entry is present otherwise entry is absent*/
	if ok {
		fmt.Println("Capital of United States is", capital)
	} else {
		fmt.Println("Capital of United States is not present")
	}

	//---
	x := map[string]int{"Kate": 28, "John": 37, "Raj": 20}
	fmt.Println("\n", x)
	fmt.Println("", x["Raj"])
}

// --------------------------------------delete() Function

func example2() {
	fmt.Printf(">>>Example2: \n")
	/* create a map*/
	countryCapitalMap := map[string]string{"France": "Paris", "Italy": "Rome", "Japan": "Tokyo", "India": "New Delhi"}

	fmt.Println("Original map")

	/* print map */
	for country := range countryCapitalMap {
		fmt.Println("Capital of", country, "is", countryCapitalMap[country])
	}

	/* delete an entry */
	delete(countryCapitalMap, "France")
	fmt.Println("Entry for France is deleted")

	fmt.Println("Updated map")

	/* print map */
	for country := range countryCapitalMap {
		fmt.Println("Capital of", country, "is", countryCapitalMap[country])
	}
}

// --------------------------------------Map of Struct
func example3() {
	m := map[string]Vertex{
		"JavaTpoint": {40.68433, -74.39967},
		"SSS-IT":     {37.42202, -122.08408},
	}

	fmt.Println(m)
	fmt.Printf(">>>Example3: \n")
}

type Vertex struct {
	Latitude, Longitude float64
}

// --------------------------------------

func example4() {
	fmt.Printf(">>>Example4: \n")
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
