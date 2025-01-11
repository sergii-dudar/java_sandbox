package main

import (
	"fmt"
	"log"
	"time"
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
	
	p := fmt.Println

	present := time.Now() // current time
	p(present)

	DOB := time.Date(1993, 02, 28, 9, 04, 39, 213, time.Local)
	fmt.Println(DOB)

	fmt.Println(DOB.Year())
	fmt.Println(DOB.Month())
	fmt.Println(DOB.Day())
	fmt.Println(DOB.Hour())
	fmt.Println(DOB.Minute())
	fmt.Println(DOB.Second())
	fmt.Println(DOB.Nanosecond())
	fmt.Println(DOB.Location())

	fmt.Println(DOB.Weekday())

	fmt.Println(DOB.Before(present))
	fmt.Println(DOB.After(present))
	fmt.Println(DOB.Equal(present))

	diff := present.Sub(DOB)
	fmt.Println(diff)
	fmt.Println(diff.Hours())
	fmt.Println(diff.Minutes())
	fmt.Println(diff.Seconds())
	fmt.Println(diff.Nanoseconds())
	fmt.Println(DOB.Add(diff))
	fmt.Println(DOB.Add(-diff))
}

// --------------------------------------

func example2() {
	
	present := time.Now()
	fmt.Println("Today : ", present.Format("Mon, Jan 2, 2006 at 3:04pm"))
	someTime := time.Date(2017, time.March, 30, 11, 30, 55, 123456, time.Local)
	// compare time with time.Equal()
	sameTime := someTime.Equal(present)
	fmt.Println("someTime equals to now ? : ", sameTime)
	// calculate the time different between today
	// and long time ago
	diff := present.Sub(someTime)
	// convert diff to days
	days := int(diff.Hours() / 24)
	fmt.Printf("30th March 2017 was %d days ago \n", days)
}

// --------------------------------------Epoch

func example3() {
	
	p := fmt.Println
	current_time := time.Now()
	secs := current_time.Unix()
	nanos := current_time.UnixNano()

	fmt.Println(current_time)

	millis := nanos / 1000000
	p(secs)
	p(millis)
	p(nanos)
	p(time.Unix(secs, 0))
	p(time.Unix(0, nanos))
}

// --------------------------------------Tickers
// https://www.javatpoint.com/go-tickers
func example4() {
	
	tickerValue := time.NewTicker(time.Millisecond * 100)
	go func() {
		for t := range tickerValue.C {
			fmt.Println("Tick at", t)
		}
	}()
	time.Sleep(time.Millisecond * 500)
	tickerValue.Stop()
	fmt.Println("Ticker stopped")
}

// --------------------------------------

func example5() {
	
	// go doPolling()
	select {} // The select statement lets a goroutine wait on multiple communication operations.
}

func haveFun(s string) {
	log.Printf("\tA: Let's have fun: %v", s)
}

func doPolling() {
	for range time.Tick(2 * time.Second) {
		haveFun("\t B : Okay!")
	}
}

// --------------------------------------

func example6() {
	
}

// --------------------------------------

func example7() {
	
}
