package main

import "fmt"


func main() {
	// for is while
	a := 0
	for a < 10 {
		fmt.Print(a)
		a++
	}
	fmt.Println()

	// and for is for
	for i := 0; i < 10; i++ {
		fmt.Print(i)
		break
	}
}
