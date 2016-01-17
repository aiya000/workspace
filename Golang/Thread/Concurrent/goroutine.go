package main

import (
	"fmt"
	"time"
)


func main() {
	fmt.Println("step 1")
	f()

	fmt.Println("step 2")
	g()

	fmt.Println("step 3")
	h()
}

func echo(s string) {
	fmt.Print("(*^o^)< ")

	for i := 0; i < 4; i++ {
		fmt.Print(s, ", ")
		time.Sleep(500 * time.Millisecond)
	}

	fmt.Println(s)
}


func f() {
	echo("foo")
	echo("hoge")
}

func g() {
	go echo("foo")
	echo("hoge")
}

func h() {
	go echo("foo")
	go echo("hoge")

	// destruct with subroutines
}
