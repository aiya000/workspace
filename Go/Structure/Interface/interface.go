package main

import (
	"fmt"
	"math"
)

/* ---===---===---===---===---===---===--- */

type Point interface {
	distanceFrom0() float64
}

/* -=-=-=-=-=-=-=-=- */

type Point2d struct {
	x, y float64
}

func newPoint2d(x, y float64) *Point2d {
	p := new(Point2d)
	p.x, p.y = x, y
	return p
}

func (p *Point2d) distanceFrom0() float64 {
	return math.Sqrt(p.x*p.x + p.y*p.y)
}

/* -=-=-=-=-=-=-=-=- */

type Point3d struct {
	x, y, z float64
}

func newPoint3d(x, y, z float64) *Point3d {
	p := new(Point3d)
	p.x, p.y, p.z = x, y, z
	return p
}

func (p *Point3d) distanceFrom0() float64 {
	return math.Sqrt(p.x*p.x + p.y*p.y + p.z*p.z)
}

/* ---===---===---===---===---===---===--- */

func sumDistanceFrom0(ps []Point) float64 {
	sum := 0.0

	for _, p := range ps {
		sum += p.distanceFrom0()
	}

	return sum
}

func main() {
	ps := []Point{newPoint2d(10, 10), newPoint3d(10, 10, 10)}

	fmt.Println(ps[0].distanceFrom0(),
		ps[1].distanceFrom0(),
		sumDistanceFrom0(ps))
}
