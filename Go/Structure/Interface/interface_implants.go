package main

import "fmt"


type A interface {
	f()
}

type B interface {
	A
	g()
}


type X struct {}

func (x *X) f() {}


type Y struct {}
func (y *Y) f() {}
func (y *Y) g() {}


func main() {
	a := []A { &X{}, &Y{} }
	//b := []B { &X{}, &Y{} }

	fmt.Println(a, b)
}
