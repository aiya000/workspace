package main

import "fmt"

type InvalidOperationError struct {
	msg string
}

func newInvalidOperationError(msg string) *InvalidOperationError {
	err := new(InvalidOperationError)
	err.msg = msg
	return err
}

func (err *InvalidOperationError) Error() string {
	return err.msg
}

type BreakTheWorldError struct {
	msg string
}

func newBreakTheWorldError(msg string) *BreakTheWorldError {
	err := new(BreakTheWorldError)
	err.msg = msg
	return err
}

func (err *BreakTheWorldError) Error() string {
	return err.msg
}

func yomeKure(name string) {
	if name == "rize" {
		fmt.Println("I feel good...")
		return
	} else if name == "gorira" {
		panic(newBreakTheWorldError("I must break this world!!!!! uraaaaaaaaaaaaaaaaaaaaa!!!!!!!!!!"))
	}

	panic(newInvalidOperationError("uwaaaaaaaaaaa!!!!!!!!!"))
}

func catcher() {
	err := recover()
	if err == nil {
		return
	}

	iErr, is := err.(*InvalidOperationError)
	if is {
		fmt.Println(iErr)
	} else {
		panic(err)
	}
}

func fA() {
	defer catcher()
	yomeKure("rize")
}

func fB() {
	defer catcher()
	yomeKure("")
}

func fC() {
	defer catcher()
	yomeKure("gorira")
}

func main() {
	fA()
	fB()
	fC()
}
