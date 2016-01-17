package main

import "fmt"


type Integer int

// append method to primitive type
func (n Integer) succ() Integer {
	return n + 1
}


func main() {
	var n1 Integer = 10
	var n2 Integer = n1.succ().succ()
	// var n2 int = n1.succ().succ()  // fail
	fmt.Println(n2)
}
