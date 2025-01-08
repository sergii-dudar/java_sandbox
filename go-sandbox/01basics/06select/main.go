package main

import (
	"fmt"
	"time"
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

func example1() {
	var c1, c2, c3 chan int
	var i1, i2 int

	select {
	case i1 = <-c1:
		fmt.Printf("received ", i1, " from c1\n")
	case c2 <- i2:
		fmt.Printf("sent ", i2, " to c2\n")
	case i3, ok := (<-c3): // same as: i3, ok := <-c3
		if ok {
			fmt.Printf("received ", i3, " from c3\n")
		} else {
			fmt.Printf("c3 is closed\n")
		}
	default:
		fmt.Printf("no communication\n")
	}
}

func example2() {
	// Defineing channels
	ch1 := make(chan string)
	ch2 := make(chan int)

	// Goroutine to send data to channel1
	go func() {
		time.Sleep(1 * time.Second)
		ch1 <- "I am in channel 1"
	}()

	// Goroutine to send data to channel2
	go func() {
		time.Sleep(3 * time.Second)
		ch2 <- 10
	}()

	// Nested select statement
	select {
	case ch_data1 := <-ch1:
		fmt.Println("Received from channel1:", ch_data1)
		select {
		case ch_data2 := <-ch2:
			fmt.Println("Received from channel2:", ch_data2)
		default:
			fmt.Println("No data in channel2 yet")
		}
	case ch_data2 := <-ch2:
		fmt.Println("Received from channel2:", ch_data2)
	default:
		fmt.Println("No messages received yet from any channel")
	}
}

func example3() {
}

func example4() {
}

func example5() {
}

func example6() {
}

func example7() {
}
