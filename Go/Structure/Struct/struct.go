package main

import "fmt"


type Point struct {
	x float64
	y float64
}


func main() {
	basic()
	pointer()

	fmt.Println("\n-- newPoint --")
	p := newPoint(10, 20)
	fmt.Println(p)

	dynamic()
}


func basic() { /*{{{*/
	fmt.Println("-- basic --")

	var a Point = Point { 10, 20 }
	var b Point = Point { x : 100, y : 200 }

	fmt.Println(a, a.x, a.y)
	fmt.Println(b, b.x, b.y)
} /*}}}*/

func pointer() { /*{{{*/
	fmt.Println("\n-- pointer --")

	var foo *Point = &Point { 10, 20 }

	fmt.Println(*foo, foo.x, foo.y)  // operator dot
} /*}}}*/

func newPoint(x, y float64) *Point { /*{{{*/
	p := new(Point)
	p.x, p.y = x, y

	return p
} /*}}}*/

func dynamic() { /*{{{*/
	fmt.Println("\n-- dynamic --")

	var ps []*Point = make([]*Point, 5)

	x, y := 10.0, 10.0
	for i := 0; i < len(ps); i++ {
		ps[i] = newPoint(x, y)

		x++; y++
	}

	for i, p := range ps {
		fmt.Println(i, ":", p)
	}
} /*}}}*/
