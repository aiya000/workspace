package main

import "fmt"

type ArithmeticError struct {
	msg string
}

func newArithmeticError(msg string) *ArithmeticError {
	err := new(ArithmeticError)
	err.msg = msg
	return err
}

func (err *ArithmeticError) Error() string {
	return err.msg
}

func div(a, b int) (int, error) {
	if b == 0 {
		return -1, newArithmeticError("div by zero")
	}

	return a / b, nil
}

func main() {
	fmt.Println(div(10, 0))
}
