package main

import "fmt"


func main() {
	// lambda apply
	f := func (x int) int { return x * 2 }
	a := f(10)
	fmt.Println(a)

	// recursive lambda
	var findOne func(int) int
	findOne = func(x int) int {
		switch { case x == 1: return x
		         case x >  0: return findOne(x - 1)
		         default    : return findOne(x + 1)
		}
	}
	fmt.Println( findOne(10) )
}
