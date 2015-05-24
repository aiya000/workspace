package main

import (
	"os"
	"io"
	"bufio"
)


func main() {
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

		if c == '\n' {
			// output
			writer.Flush()
		}
	}

	writer.Flush()
}
