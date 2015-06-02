// panic is runtime error

package main

import "fmt"


func fact(n int) int {
	if n < 0 {
		panic("uwaaaaaaa!!!!!!! yattaaaaaa!!!!!!")
	}

	a := n
	for i := n - 1; i > 1; i-- {
		a *= i
	}

	return a
}


func main() {
	a := fact(5)
	fmt.Println(a)

	b := fact(-1)
	fmt.Println(b)
}
