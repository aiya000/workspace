package main

import (
	"fmt"
	"time"
)


func makeRoutine(s string, in <-chan int) chan int {
	out := make(chan int)
	f   := func () {
		for {
			<- in  // wait
			fmt.Print(s)
			time.Sleep(50 * time.Millisecond)
			out <- 0
		}
	}

	go f()
	return out
}

func main() {
	ch1 := make(chan int)
	ch2 := makeRoutine("a", ch1)
	ch3 := makeRoutine("h", ch2)
	ch4 := makeRoutine("o", ch3)
	ch5 := makeRoutine("g", ch4)
	ch6 := makeRoutine("e", ch5)

	for i := 0; i < 10; i++ {
		ch1 <- 0
		<- ch6
	}
}
