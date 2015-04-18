package main

import "fmt"


func main() {
	a := 10

	// execute just 'case 10' only
	switch a {
	case 30:
		fmt.Println("foo")
		break
	case 20:
	case 10:
		fmt.Println("bar")
	default:
		fmt.Println("hoge")
	}

	// !?
	for i := 0; i < 30; i++ {
		fmt.Print(i, ":"); switch { case i % 15 == 0: fmt.Println("FizzBuzz")
		                            case i % 3  == 0: fmt.Println("Fizz")
		                            case i % 5  == 0: fmt.Println("Buzz")
		                            default:          fmt.Println(i)
		                    }
	}
}
