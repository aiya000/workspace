package main

import "fmt"


func main() {
	fmt.Println("step 1 : normal")
	a := fibonacci(27)
	fmt.Println(a)

	fmt.Println("\nstep 2 : goroutine")
	b := GetFibonacciP(27)
	fmt.Println(b)
}


func fibonacci(n int) int {
	if n <= 1 {
		return 1
	}

	return fibonacci(n - 1) + fibonacci(n - 2)
}


func GetFibonacciP(n int) int {
	channel := make(chan int)

	go fibonacciP(n, channel)

	return <- channel
}

func fibonacciP(n int, c chan<- int) {
	if n <= 1 {
		c <- 1
		return
	}

	c1 := make(chan int)
	c2 := make(chan int)

	go fibonacciP(n - 1, c1)
	go fibonacciP(n - 2, c2)

	a := <- c1
	b := <- c2

	c <- a + b
}
