package main


type A struct {}
type B struct {}


// empty interface
func f(_ interface{}) {}


func main() {
	// send A pointer
	a := new(A)
	f(a)

	// send B instance
	b := B {}
	f(b)
}
