package main

import (
	"./parser"
	"./types"
	"fmt"
	"os"
)

func interact(lex *types.ScanLex) bool {
	r := false

	defer func() {
		err := recover()
		if err != nil {
			msg, ok := err.(string)
			if ok && msg == "quit" {
				r = true
			} else {
				fmt.Fprintln(os.Stderr, err)
				for lex.Token != ';' {
					lex.GetToken()
				}
			}
		}
	}()

	for {
		fmt.Print("Calc> ")
		lex.GetToken()
		val := parser.Expr(lex)
		if lex.Token != ';' {
			panic("invalid expression")
		} else {
			fmt.Println(val)
		}
	}

	return r
}

func main() {
	var lex types.ScanLex
	lex.Init(os.Stdin)
	for {
		if interact(&lex) {
			break
		}
	}
}
