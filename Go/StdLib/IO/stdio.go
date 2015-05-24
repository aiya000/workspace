package main

import "os"


func main() {
	buf := make([]byte, 256)

	for {
		i, _ := os.Stdin.Read(buf)

		os.Stdout.Write(buf[:i])
	}
}
