package main

import (
	"fmt"
	"math/rand"
	"sync"
	"sync/atomic"
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

// https://www.javatpoint.com/go-concurrency
// --------------------------------------Goroutines

var wg = sync.WaitGroup{}

func example1() {
	wg.Add(2)
	go fun1()
	go fun2()
	wg.Wait()
}

func fun1() {
	for i := 0; i < 10; i++ {
		fmt.Println("fun1,  ->", i)
		time.Sleep(time.Duration(5 * time.Millisecond))
	}
	wg.Done()
}

func fun2() {
	for i := 0; i < 10; i++ {
		fmt.Println("fun2,  ->", i)
		time.Sleep(time.Duration(10 * time.Millisecond))
	}
	wg.Done()
}

// --------------------------------------Race
var (
	wait  sync.WaitGroup
	count int64
)

func example2() {
	fmt.Printf(">>>Example2: \n")
	wait.Add(2)
	go increment("foo: ")
	go increment("bar: ")
	wait.Wait()
	fmt.Println("last count value ", count)
}

func increment(s string) {
	for i := 0; i < 10; i++ {
		x := count
		x++
		time.Sleep(time.Duration(rand.Intn(4)) * time.Millisecond)
		count = x
		fmt.Println(s, i, "Count: ", count)

	}
	wait.Done()
}

// --------------------------------------Race Mutex
var mutex sync.Mutex

func example3() {
	fmt.Printf(">>>Example3: \n")
	count = 0
	wait.Add(2)
	go incrementSync("foo: ")
	go incrementSync("bar: ")
	wait.Wait()
	fmt.Println("last count value ", count)
}

func incrementSync(s string) {
	for i := 0; i < 10; i++ {
		mutex.Lock()
		x := count
		x++
		time.Sleep(time.Duration(rand.Intn(10)) * time.Millisecond)
		count = x
		fmt.Println(s, i, "Count: ", count)
		mutex.Unlock()

	}
	wait.Done()
}

// --------------------------------------Atomic Variable

func example4() {
	fmt.Printf(">>>Example4: \n")
	count = 0
	wait.Add(2)
	go incrementAtomic("foo: ")
	go incrementAtomic("bar: ")
	wait.Wait()
	fmt.Println("last count value ", count)
}

func incrementAtomic(s string) {
	for i := 0; i < 10; i++ {
		time.Sleep(time.Duration((rand.Intn(3))) * time.Millisecond)
		atomic.AddInt64(&count, 1)
		fmt.Println(s, i, "Count ->", count)
	}
	wait.Done()
}

// --------------------------------------Go Channel

func example5() {
	fmt.Printf(">>>Example5: \n")
	done := make(chan bool, 1)
	go worker(done)
	fmt.Println("waiting of worker...")
	<-done
}

func worker(done chan bool) {
	fmt.Println("working...")
	time.Sleep(time.Second)
	fmt.Println("done")
	done <- true
}

// --------------------------------------Worker Pools

func example6() {
	fmt.Printf(">>>Example6: \n")
	job := make(chan int, 10)
	result := make(chan int, 10)
	for w := 1; w <= 2; w++ {
		go workerPool(w, job, result)
	}
	for j := 1; j <= 9; j++ {
		job <- j
	}
	close(job)
	for a := 1; a <= 9; a++ {
		<-result
	}
}

func workerPool(id int, jobs <-chan int, results chan<- int) {
	for j := range jobs {
		fmt.Println("worker", id, "processing job", j)
		time.Sleep(time.Second)
		results <- j * 2
	}
}

// --------------------------------------

func example7() {
	fmt.Printf(">>>Example7: \n")
}
