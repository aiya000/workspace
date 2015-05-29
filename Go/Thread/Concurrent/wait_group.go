package main

import (
	"fmt"
	"time"
	"sync"
)


func echo(s string, wg *sync.WaitGroup) {
	for i := 0; i < 5; i++ {
		fmt.Println(s, "\t:\t", i)
		time.Sleep(500 * time.Millisecond)
	}

	wg.Done()  // decrement count
}

func main() {
	var wg sync.WaitGroup
	wg.Add(3)  // add count

	go echo("foo", &wg)
	go echo("bar", &wg)
	go echo("baz", &wg)

	wg.Wait()  // syncronous threads
}
