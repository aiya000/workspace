package main

import "fmt"

var a int = 10
var b int = a
var c float64 = 20.0
//d := 30

func main() {
	var d byte = 30

	var (e,f = 40,50)
	var (g,h = 60,70.0)

	i   := 80
	j,k := 90,100
	k = 110

	var l string = "foo"
	m := "bar"
	n := l + m
	//o := n + 10

	fmt.Println(a,b,c,d,e,f,g,h,i,j,k,l,m,n)
}
