package main

import "fmt"


func main() {
	// basic pointer
	var a   int = 10
	var pa *int = &a
	fmt.Println(pa, *pa)

	// array pointer
	// go's array does not express head address
	var as   [5]int = [5]int { 1, 2, 3, 4, 5 }
	var pas *[5]int = &as
	pa = &pas[0]
	fmt.Println(pas, *pas)
	fmt.Println(pa, *pa)
	fmt.Println(&as[1], &as[2], &as[3])

	// !?
	var xs  [1]int = [1]int { 1 }
	var p  *[1]int = &xs
	var pp *int    = &p[0]  // &p[0] = &(p[0]) !?
	fmt.Println(pp)
}
