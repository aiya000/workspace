package main

import "fmt"


func main() {
	var as [10]int
	var bs [10]int = [10]int { 1,2,3,4,5,6,7,8,9,10 }
	cs := [...]int { 11,12,13,14,15,16,17,18,19 }

	var ds [2][2]int = [2][2]int {
		{ 1,2 },
		{ 4,5 },
	}

	var es = as
	es[0] = 22

	fmt.Println(as[0])
	fmt.Println(len(bs))
	fmt.Println(cs)
	fmt.Println(ds)
	fmt.Println(es)
}
