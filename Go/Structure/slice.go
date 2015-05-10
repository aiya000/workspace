package main


import "fmt"


func main() {
	xs := []int { 1, 2 ,3 ,4 ,5 }

	// slice
	a := xs[1:3]
	b := xs[2:]
	c := b[:2]

	fmt.Println(xs, a, b, c)

	// address was shared
	y := xs[:1]
	y[0] = 10

	fmt.Println(xs, y)

	// append items
	z := append(y, 20, 30)

	fmt.Println(z, y)

	// address shared
	z[0] = 100
	fmt.Println(z, y, xs)
}
