package main

import (
	"fmt"
	"os"
	"text/scanner"
)

func main() {
	var in scanner.Scanner
	in.Init(os.Stdin)
	for {
		fmt.Print("> ")
		k := in.Scan()
		s := in.TokenText()
		fmt.Println(k, s)

		fmt.Print("kind: ")
		switch k {
		case scanner.Ident: // ex) var
			fmt.Println("Ident")
		case scanner.Int: // ex) 10
			fmt.Println("Int")
		case scanner.Float: // ex) 10.0
			fmt.Println("Float")
		case scanner.Char: // ex) 'a'
			fmt.Println("Char")
		case scanner.String: // ex) "a"
			fmt.Println("String")
		case scanner.Comment: // ex) ??
			fmt.Println("Comment")
		default:
			fmt.Println("another")
		}
	}
}
