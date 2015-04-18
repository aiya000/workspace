package main

import "fmt"


func f() [100]int {// {{{
	var primes [100]int
	primes[0] = 2
	size     := 1

	for i := 3; i < len(primes); i += 2 {
		isPrime := true

		for j := 0; j < size; j++ {
			prime := primes[j]

			if i % prime == 0 {
				isPrime = false
				break
			}
		}

		if isPrime {
			primes[size] = i
			size++
		}
	}

	//var result [size - 1]int
	//for i := 0; i < len(primes); i++ {
	//	result[0] = primes[0];
	//}

	//return result

	return primes
}// }}}


func main() {
	primes1 := f()

	fmt.Println(primes1)
}
