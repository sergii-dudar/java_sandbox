package main

import (
	"fmt"
	"log"
	"os"
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
	

	fmt.Println("write to file------------")
	data := []byte("Hello!\nWelcome to Tutorialspoint.")
	// Write the content to a file
	er := os.WriteFile("file1.txt", data, 8649)
	if er != nil {
		log.Fatalf("Failed to write to file: %v", er)
	}
	log.Println("The written files is printed successfully!")

	fmt.Println("\nread from file------------")
	data, err := os.ReadFile("file1.txt")
	if err != nil {
		log.Fatal(err)
	}
	// Display the content
	fmt.Println(string(data))
}

// --------------------------------------

func example2() {
	
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
