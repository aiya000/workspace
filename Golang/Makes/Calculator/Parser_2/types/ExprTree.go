package types

import "fmt"

type Value float64

// expression
type Expression interface {
	Eval() Value
}

func (v Value) Eval() Value {
	return v
}

// unary operator
type Op1 struct {
	code rune
	expr Expression
}

func NewOp1(code rune, e Expression) Expression {
	return &Op1 { code, e }
}

func (e *Op1) Eval() Value {
	v := e.expr.Eval()
	if e.code == '-' {
		v = -v
	}
	return v
}

// binary operator
type Op2 struct {
	code rune
	lhs, rhs Expression
}

func NewOp2(code rune, lhs, rhs Expression) Expression {
	return &Op2 { code, lhs, rhs }
}

func (e *Op2) Eval() Value {
	lhs := e.lhs.Eval()
	rhs := e.rhs.Eval()

	switch e.code {
		case '+': return lhs + rhs
		case '-': return lhs - rhs
		case '*': return lhs * rhs
		case '/': return lhs / rhs
		default : panic(fmt.Errorf("unexpected binary operator: %v", e.code))
	}
}
