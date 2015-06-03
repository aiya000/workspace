package main

import "fmt"

/* ---===---===---===---===---===---===--- */

func sumIntElem(xs []interface{}) int {
	sum := 0
	for _, x := range xs {
		v, isInt := x.(int)
		if isInt {
			sum += v
		}
	}

	return sum
}

/* ---===---===---===---===---===---===--- */

func main() {
	xs := []interface{}{10, 20.0, "30", 40, 50.0, "60"}

	a := sumIntElem(xs)
	fmt.Println(a)
}
