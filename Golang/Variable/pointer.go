package main

import "fmt"


func main() {
	basic()
	array()
	slice()

	var x int
	ref(&x)
	fmt.Println(x)
}


func basic() { /*{{{*/
	// basic pointer
	var x   int = 10
	var px *int = &x
	fmt.Println(px, *px)

	*px = 20
	fmt.Println(x)
} /*}}}*/

func array() { /*{{{*/
	// go's array does not express head address
	var xs   [5]int = [5]int { 1, 2, 3, 4, 5 }
	var pxs *[5]int = &xs

	fmt.Println(pxs, *pxs)
	fmt.Println(&xs[1], &xs[2], &xs[3])
} /*}}}*/

func slice() { /*{{{*/
	var xs   []int = []int { 1, 2, 3, 4, 5 }
	var pxs *[]int = &xs

	fmt.Println(pxs, *pxs)
	fmt.Println(&xs[1], &xs[2], &xs[3])

	// oops!!
	// var s string = "foo"
	// var pc       = &s[0]  // We cannot get char pointer that is string internal char item
	// fmt.Println(pc, *pc)
} /*}}}*/

func ref(x *int) { /*{{{*/
	*x = 100
} /*}}}*/
