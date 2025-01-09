package main

import (
	"fmt"
	"log"
	"os"
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
	fmt.Printf(">>>Example2: \n")
}

// --------------------------------------

func example3() {
	fmt.Printf(">>>Example3: \n")
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
