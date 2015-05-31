package main

import (
	"fmt"
	//"errors"
	//"strconv"
)

// type error interface {
//   Error() string
// }

func fibonacci(n int) (int, error) {
	if n < 0 {
		//return -1, errors.New("Invalid Argument : " + strconv.Itoa(n))
		return -1, fmt.Errorf("Invalid Argument : %d", n)
	}

	if n <= 1 {
		return 1, nil
	}

	a, err1 := fibonacci(n - 1)

	if err1 != nil {
		return -1, err1
	}

	b, err2 := fibonacci(n - 2)

	if err2 != nil {
		return -1, err2
	}

	return a + b, nil
}

func main() {
	a, err1 := fibonacci(3)

	if err1 != nil {
		fmt.Println(err1)
	}
	fmt.Println(a)

	b, err2 := fibonacci(-1)

	if err2 != nil {
		fmt.Println(err2)
	}
	fmt.Println(b)
}
