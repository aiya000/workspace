package main

import "fmt"

func throw() {
	panic("guwaaaaaaaaaaaaaaaaaa!!!!!!!!")
}

func catcher() {
	err := recover()
	fmt.Println("Yaaaaaaaaaahhhhhhhh!!!!!!!")
	fmt.Print("error: ")
	fmt.Println(err)
}

func fA() {
	defer catcher()
	throw()
}

func fB() {
	defer catcher()
}

func gA() int {
	defer catcher()
	throw()
	return 1
}

func gB() (n int) {
	defer func() {
		err := recover()
		fmt.Println(err)
		n = -1
	}()
	throw()

	return 1
}

func main() {
	fA()
	fB()

	a := gA()
	fmt.Println("returned value [", a, "] from gA")
	b := gB()
	fmt.Println("returned value [", b, "] from gB")
}
