package main

import "fmt"


func main() {
	f()
	g()
}

func f() { /*{{{*/
	// for is while
	a := 0
	for a < 10 {
		fmt.Print(a)
		a++
	}
	fmt.Println()

	// for is for
	for i := 0; i < 10; i++ {
		fmt.Print(i)
		break
	}
	fmt.Println()
} /*}}}*/

func g() { /*{{{*/
	// range based for

	// index, value
	for i, v := range []int { 2, 4, 5, 1, 3} {
		fmt.Println(i, v)
	}

	// key, value
	for k, v := range map[string]int { "a" : 10, "b" : 20 } {
		fmt.Println(k, v);
	}
} /*}}}*/
