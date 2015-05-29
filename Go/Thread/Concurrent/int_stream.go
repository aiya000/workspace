package main

import "fmt"


// lazy stream
type IntStream chan int

func makeIntStream(n, m int) IntStream {
	stream := make(IntStream)

	if n > m { fmt.Println("baka...") }

	go func () {
		for i := n; i <= m; i++ {
			stream <- i
		}
		close(stream)
	}()

	return stream
}

func (stream IntStream) smap(f func(int) int) IntStream {
	newStream := make(IntStream)

	go func () {
		for {
			x, ok := <- stream

			if !ok {
				fmt.Println("...")
				break
			}

			newStream <- f(x)
		}
		close(newStream)
	}()

	return newStream
}

func (stream IntStream) sfilter(p func(int) bool) IntStream {
	newStream := make(IntStream)

	go func () {
		for {
			x, ok := <- stream

			if !ok {
				fmt.Println("...!?")
				break;
			}

			if p(x) {
				newStream <- x
			}
		}
		close(newStream)
	}()

	return newStream
}


func main() {
	twice    := func(x int) int  { return x * 2 }
	fivefold := func(x int) bool { return x != 0 && x % 5 == 0 }
	iStream  := makeIntStream(0, 10).smap(twice).sfilter(fivefold)

	for i := range iStream {
		fmt.Println(i)
	}
}
