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

// --------------------------------------
type Books struct {
	title   string
	author  string
	subject string
	book_id int
}

func example1() {
	
	var Book1 Books /* Declare Book1 of type Book */
	var Book2 Books /* Declare Book2 of type Book */

	/* book 1 specification */
	Book1.title = "Go Programming"
	Book1.author = "Mahesh Kumar"
	Book1.subject = "Go Programming Tutorial"
	Book1.book_id = 6495407

	/* book 2 specification */
	Book2.title = "Telecom Billing"
	Book2.author = "Zara Ali"
	Book2.subject = "Telecom Billing Tutorial"
	Book2.book_id = 6495700

	/* print Book1 info */
	fmt.Printf("Book 1 title : %s\n", Book1.title)
	fmt.Printf("Book 1 author : %s\n", Book1.author)
	fmt.Printf("Book 1 subject : %s\n", Book1.subject)
	fmt.Printf("Book 1 book_id : %d\n", Book1.book_id)

	/* print Book2 info */
	fmt.Printf("\nBook 2 title : %s\n", Book2.title)
	fmt.Printf("Book 2 author : %s\n", Book2.author)
	fmt.Printf("Book 2 subject : %s\n", Book2.subject)
	fmt.Printf("Book 2 book_id : %d\n", Book2.book_id)
}

// --------------------------------------Structures as Function Arguments

func example2() {
	
	var Book1 Books /* Declare Book1 of type Book */
	var Book2 Books /* Declare Book2 of type Book */

	/* book 1 specification */
	Book1.title = "Go Programming"
	Book1.author = "Mahesh Kumar"
	Book1.subject = "Go Programming Tutorial"
	Book1.book_id = 6495407

	/* book 2 specification */
	Book2.title = "Telecom Billing"
	Book2.author = "Zara Ali"
	Book2.subject = "Telecom Billing Tutorial"
	Book2.book_id = 6495700

	/* print Book1 info */
	printBook(Book1)

	fmt.Printf("\n")
	/* print Book2 info */
	printBook(Book2)
}

func printBook(book Books) {
	fmt.Printf("Book title : %s\n", book.title)
	fmt.Printf("Book author : %s\n", book.author)
	fmt.Printf("Book subject : %s\n", book.subject)
	fmt.Printf("Book book_id : %d\n", book.book_id)
}

// --------------------------------------Pointers to Structures

func example3() {
	
	var Book1 Books /* Declare Book1 of type Book */
	var Book2 Books /* Declare Book2 of type Book */

	/* book 1 specification */
	Book1.title = "Go Programming"
	Book1.author = "Mahesh Kumar"
	Book1.subject = "Go Programming Tutorial"
	Book1.book_id = 6495407

	/* book 2 specification */
	Book2.title = "Telecom Billing"
	Book2.author = "Zara Ali"
	Book2.subject = "Telecom Billing Tutorial"
	Book2.book_id = 6495700

	/* print Book1 info */
	printBookPtr(&Book1)

	fmt.Printf("\n")
	/* print Book2 info */
	printBookPtr(&Book2)
}

func printBookPtr(book *Books) {
	fmt.Printf("Book title : %s\n", book.title)
	fmt.Printf("Book author : %s\n", book.author)
	fmt.Printf("Book subject : %s\n", book.subject)
	fmt.Printf("Book book_id : %d\n", book.book_id)
}

// --------------------------------------Embedded Struct

func example4() {
	
	p1 := person{"Raj", "Kumar"}
	p1.details()
	e1 := employee{person: person{"John", "Ponting"}, empId: 11}
	e1.details()
}

type person struct {
	fname string
	lname string
}
type employee struct {
	person
	empId int
}

func (p person) details() {
	fmt.Println(p, " "+" I am a person")
}

func (e employee) details() {
	fmt.Println(e, " "+"I am a employee")
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
