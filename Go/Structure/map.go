package main

import "fmt"

func main() {
	f()
	g()
}


func f() { /*{{{*/
	// Eq a => map a b

	// a :: map string int
	var a map[string]int

	// b :: map int string
	var b map[int]string

	fmt.Println(a, b)

	// initialize
	var m map[string]int = map[string]int { "a" : 10, "b" : 20 }
	fmt.Println(m, m["a"], m["b"], len(m))
} /*}}}*/

func g() { /*{{{*/
	// empty map
	var m map[string]int = make(map[string]int)

	// append items
	m["a"] = 10

	fmt.Println(m["a"])

	// nothing item ( if key nothing, b is false )
	v, b := m["b"]
	fmt.Println(v == 0, b)

	// delete item
	delete(m, "a")

	_, b1 := m["a"]
	fmt.Println(m, b1)
} /*}}}*/
