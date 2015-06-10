package parser

import (
	"../types"
	"fmt"
	"text/scanner"
)

func Expr(lex *types.ScanLex) types.Expression {
	e := Term(lex)
	for {
		switch lex.Token {
		case '+':
			lex.GetToken()
			e = types.NewOp2('+', e, Term(lex))
		case '-':
			lex.GetToken()
			e = types.NewOp2('-', e, Term(lex))
		default:
			return e
		}
	}
}

func Term(lex *types.ScanLex) types.Expression {
	e := Factor(lex)
	for {
		switch lex.Token {
		case '*':
			lex.GetToken()
			e = types.NewOp2('*', e, Factor(lex))

		case '/':
			lex.GetToken()
			e = types.NewOp2('/', e, Factor(lex))
		default:
			return e
		}
	}
}

func Factor(lex *types.ScanLex) types.Expression {
	switch lex.Token {
	case '(':
		lex.GetToken()
		e := Expr(lex)
		if lex.Token != ')' {
			panic("')' extected")
		}
		lex.GetToken()
		return e
	case '+':
		lex.GetToken()
		return types.NewOp1('+', Factor(lex))
	case '-':
		lex.GetToken()
		return types.NewOp1('-', Factor(lex))
	case scanner.Int, scanner.Float:
		var d float64
		fmt.Sscan(lex.TokenText(), &d)
		lex.GetToken()
		return types.Value(d)
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
