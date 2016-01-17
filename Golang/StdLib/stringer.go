package main

import (
	"fmt"
	"strconv"
)


type Integer int

// overridden function
func (n Integer) String() string {
	return "(" + strconv.Itoa(int(n)) + ")"
}


func main() {
	n := Integer(10)

	// Println call String()
	fmt.Println(n)
}
