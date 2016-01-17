package main

import "fmt"

type ArgumentError struct {
	msg string
}

func (err *ArgumentError) Error() string {
	return err.msg
}

func newArgumentError(s string) *ArgumentError {
	err := new(ArgumentError)
	err.msg = s
	return err
}

func addIntInt(a, b interface{}) int {
	x, is1 := a.(int)
	y, is2 := b.(int)

	if !(is1 && is2) {
		panic(newArgumentError("The arguments must be integer"))
	}

	return x + y
}

func main() {
	a := addIntInt(10, 20)
	fmt.Println(a)

	b := addIntInt("10", "20")
	fmt.Println(b)
}
