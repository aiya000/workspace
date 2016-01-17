package parser

import (
	"../types"
	"fmt"
	"text/scanner"
)

func Expr(lex *types.ScanLex) float64 {
	val := Term(lex)
	for {
		switch lex.Token {
		case '+':
			lex.GetToken()
			val += Term(lex)
		case '-':
			lex.GetToken()
			val -= Term(lex)
		default:
			return val
		}
	}
}

func Term(lex *types.ScanLex) float64 {
	val := Factor(lex)
	for {
		switch lex.Token {
		case '*':
			lex.GetToken()
			val *= Factor(lex)
		case '/':
			lex.GetToken()
			val /= Factor(lex)
		default:
			return val
		}
	}
}

func Factor(lex *types.ScanLex) float64 {
	switch lex.Token {
	case '(':
		lex.GetToken()
		val := Expr(lex)
		if lex.Token != ')' {
			panic("')' extected")
		}
		lex.GetToken()
		return val
	case '+':
		lex.GetToken()
		return Factor(lex)
	case '-':
		lex.GetToken()
		return (-Factor(lex))
	case scanner.Int, scanner.Float:
		var d float64
		fmt.Sscan(lex.TokenText(), &d)
		lex.GetToken()
		return d
	case scanner.Ident:
		text := lex.TokenText()
		if text == "quit" {
			panic(text)
		}
		fallthrough
	default:
		panic(fmt.Errorf("unexpected token: %v", lex.TokenText()))
	}
}
