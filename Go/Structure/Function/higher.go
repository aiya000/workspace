package main

import "fmt"


func main() {
	// lambda apply
	f := func (x int) int { return x * 2 }
	a := f(10)
	fmt.Println(a)

	// get function
	getter()()

	// using hier-function
	bs := applyer(f)
	fmt.Println(bs)
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
