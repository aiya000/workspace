package main

import "fmt"


func main() {
	// get function
	getter()()

	// using hier-function
	bs := applyer(func (x int) int { return x * 2 })
	fmt.Println(bs)

	// closure
	g := closure(10)
	fmt.Println( g(20) )
}

func applyer (f func(int) int) [5]int { /*{{{*/
	xs := []int { 1, 2, 3, 4, 5 }
	var ys [5]int

	for i := 0; i < len(xs); i++ {
		ys[i] = f(xs[i])
	}

	return ys
} /*}}}*/

func getter() func () { /*{{{*/
	return func () {
		fmt.Println("foo")
	}
} /*}}}*/

func closure(x int) func(int) int { /*{{{*/
	return func(y int) int {
		return x + y
	}
} /*}}}*/
