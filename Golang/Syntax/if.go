package main

import "fmt"


func main() {
	var a bool = true

	if a {
		fmt.Println(a)
	} else {
		fmt.Println(false)
	}


	// funny golang's if-syntax
	if b := 10; b == 10 {
		fmt.Println("if 'foo'; 'cond' { ... } else { ... }")
	}
}
