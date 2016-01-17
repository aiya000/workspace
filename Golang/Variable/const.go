package main

import "fmt"

func main() {
	const a = 10
	const (
		b = '2'
		c = "30"
	)

	const (
		x = iota
		y
		z
	)

	fmt.Println(a,b,c)
	fmt.Println(x,y,z)
}
