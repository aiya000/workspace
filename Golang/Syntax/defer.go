package main

import "fmt"


func f() {
	defer fmt.Println("f> f end")
	fmt.Println("f> f start")
}

func g() {
	defer fmt.Println("g> g end")
	fmt.Println("g> g start")
	f()
	fmt.Println("g> f called")
}


func k() {
	defer fmt.Println("k> k end")
	fmt.Println("k> k start")
	panic("yatta!!")
}


func main() {
	g()
	k()
}
