package main

import (
	"fmt"
	"os"
	"io"
	"bufio"
)


func main() {
	fmt.Println("step 1")
	f()

	fmt.Println("step 2")
	f_dash()
}


func f() { /*{{{*/
	reader := bufio.NewReader(os.Stdin)
	writer := bufio.NewWriter(os.Stdout)

	for {
		// input
		c, err := reader.ReadByte()

		// if END OF FILE ( unused in this sample, used fileio )
		if err == io.EOF {
			break
		}

		writer.WriteByte(c)

		if c == 'q' {
			break
		} else if c == '\n' {
			// output buffered bytes
			writer.Flush()
		}
	}

	writer.Flush()
} /*}}}*/

func f_dash() { /*{{{*/
	reader := bufio.NewReader(os.Stdin)
	writer := bufio.NewWriter(os.Stdout)

	for {
		s, err := reader.ReadString('\n')  // specify delimiter

		if s == "q\n" || err == io.EOF {
			break
		}

		writer.WriteString(s)

		writer.Flush()
	}
} /*}}}*/
