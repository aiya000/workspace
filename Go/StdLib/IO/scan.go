package main

import "fmt"


func main() {
	var n int
	var f float64
	var s string

	fmt.Print("Please input: ")

	// input example:
	// 10 20.0 aa
	i, err := fmt.Scan(&n, &f, &s)

	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println("inputs", i, "items :", n, f, s)
}
