package main

import (
	"fmt"
	"log"
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

// --------------------------------------

func example1() {
	fmt.Printf(">>>Example1: \n")
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
	fmt.Printf(">>>Example2: \n")
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
	fmt.Printf(">>>Example3: \n")
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
	fmt.Printf(">>>Example4: \n")
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
	fmt.Printf(">>>Example5: \n")
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
	fmt.Printf(">>>Example6: \n")
}

// --------------------------------------

func example7() {
	fmt.Printf(">>>Example7: \n")
}
