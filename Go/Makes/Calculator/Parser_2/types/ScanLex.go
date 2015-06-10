package types

import "text/scanner"

type ScanLex struct {
	scanner.Scanner
	Token rune
}

func (lex *ScanLex) GetToken() {
	lex.Token = lex.Scan()
}
