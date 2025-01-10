package main

import (
	"fmt"
	"time"
)

// In Go, channels (chan) are used for communication between goroutines.
// They provide a way to send and receive values between different goroutines,
// enabling concurrent programming
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
	// Create a new channel
	ch := make(chan int)

	// Start a new goroutine
	go func() {
		// Send a value to the channel
		fmt.Print("sending\n")
		ch <- 42
		fmt.Print("sent\n")
	}()

	// Receive the value from the channel
	fmt.Print("receiving\n")
	value := <-ch
	fmt.Println("Received value:", value)
}

func worker(done chan bool) {
	fmt.Println("Working...")
	time.Sleep(2 * time.Second)
	fmt.Println("Done")
	done <- true
}

func example2() {
	done := make(chan bool)

	go worker(done)

	// Wait for the worker to send a signal on the channel
	<-done
	fmt.Println("Worker finished")
}

func example3() {
	// Create a buffered channel with capacity 2
	ch := make(chan int, 2)

	// Send values to the buffered channel
	ch <- 1
	ch <- 2

	// Receive values from the buffered channel
	fmt.Println(<-ch)
	fmt.Println(<-ch)
}

func example4() {
	ch := make(chan int)

	// Start a new goroutine
	go func() {
		for i := 0; i < 5; i++ {
			ch <- i
		}
		close(ch)
	}()

	// Receive values from the channel until it is closed
	for value := range ch {
		fmt.Println("Received value:", value)
	}
}

func example5() {
}

func example6() {
}

func example7() {
}