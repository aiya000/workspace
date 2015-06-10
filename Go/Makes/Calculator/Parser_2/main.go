package main

import (
	"./parser"
	"./types"
	"fmt"
	"os"
)

func run(lex *types.ScanLex) bool {
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

	interact(lex)

	return r
}

func interact(lex *types.ScanLex) {
	for {
		fmt.Print("Calc> ")
		lex.GetToken()
		e := parser.Expr(lex)
		if lex.Token != ';' {
			panic("invalid expression")
		} else {
			fmt.Println(e.Eval())
		}
	}
}

func main() {
	var lex types.ScanLex
	lex.Init(os.Stdin)
	for {
		if run(&lex) {
			break
		}
	}
}
