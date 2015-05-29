package main

import (
	"fmt"
	"time"
)


func echo(s string, c chan<- string) {
	for i := 0; i < 5; i++ {
		fmt.Println(s, "\t:\t", i)
		time.Sleep(500 * time.Millisecond)
	}

	c <- s  // send s to c channel
}

func main() {
	channel := make(chan string)

	go echo("foo",  channel)
	go echo("hoge", channel)
	go echo("bar",  channel)

	a, x := <- channel  // wait and get result
	b, y := <- channel  //
	c, z := <- channel  // :: (fetched data, succeed)

	fmt.Println(a, b, c, x, y, z)
}
