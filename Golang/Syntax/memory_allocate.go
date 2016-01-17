package main

import "fmt"


func main() {
	basic()
}


func basic() {
	var i *int = new(int)
	fmt.Println(i)
}
