package main

import "fmt"


type Triangle struct {
	a float64
	b float64
	c float64

	size func() float64
}

func size(tri *Triangle) float64 {
	sideAB := tri.b - tri.a
	sideBC := tri.c - tri.a

	return (sideAB * sideBC) / 2.0
}

func newTriangle(a, b, c float64) *Triangle {
	tri := new(Triangle)

	tri.a, tri.b, tri.c = a, b, c
	tri.size = func() float64 { return size(tri) }  // closure

	return tri
}


func main() {
	t := newTriangle(10, 30, 30)
	fmt.Println( t.size() )
}
