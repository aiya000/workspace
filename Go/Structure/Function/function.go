package main

import "fmt"


func main() {
	// basics
	fmt.Println( twice(10) )

	// returned multi value
	x, y := multiValue(10, 20)
	fmt.Println(x, y)

	// !?
	fmt.Println( returnVar() )

	// variable arguments
	fmt.Println( varArg(10, 1, 2, 3, 4, 5) )

	// slice to var arguments
	xs := []int { 10, 20, 30 }
	fmt.Println( varArg(1, xs...) )
}


func twice(x int) int {
	return x * x
}

func multiValue(a, b int) (int, int) {
	return a + b, 0
}

func returnVar() (a int) {
	a = 10
	return
}

func varArg(a int, xs ...int) int {
	a += a

	for _, i := range xs { a += i }

	return a
}

