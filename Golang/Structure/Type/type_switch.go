package main

import "fmt"

func main() {
	xs := []interface{}{10, 20.0, "30"}

	for _, x := range xs {
		switch x.(type) {
		case int:
			fmt.Println("Integer")
		case float64:
			fmt.Println("Float")
		case string:
			fmt.Println("String")
		}
	}
}
