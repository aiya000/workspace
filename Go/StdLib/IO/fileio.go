package main

import (
	"fmt"
	"os"
	"io/ioutil"
)


const (
	inputSource  = "fileio.go"
	outputSource = "fileio_mirror.go"
)


func main() {
	f()
	g()
}


func f() { /*{{{*/
	// file open read mode
	input, err := os.Open(inputSource)

	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		fmt.Fprintln(os.Stderr, "program exit")
		os.Exit(1)
	}

	// file open write mode
	output, _ := os.Create(outputSource)
	buf       := make([]byte, 256)

	for {
		c, _ := input.Read(buf)

		if c == 0 {
			break
		}

		output.Write(buf[:c])
	}

	input.Close();
	output.Close();
} /*}}}*/

func g() {
	buf, err := ioutil.ReadFile(inputSource)

	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		fmt.Fprintln(os.Stderr, "program exit")
		os.Exit(1)
	}

	os.Stdout.Write(buf)
}
