package main

import "fmt"



type Tree struct {
	value int
	left  *Tree
	right *Tree
}

func (t *Tree) binarySearch(value int) bool {
	if t.value == value {
		return true
	} else if t.value > value {
		return t.left  != nil && t.left.binarySearch(value)
	} else {
		return t.right != nil && t.right.binarySearch(value)
	}
}

func (t *Tree) append(value int) {
	if t.value > value {
		if t.left == nil {
			t.left = &Tree { value, nil, nil }
		} else {
			t.left.append(value)
		}
	} else if t.value < value {
		if t.right == nil {
			t.right = &Tree { value, nil, nil }
		} else {
			t.right.append(value)
		}
	}
}

func (t *Tree) foldPrint() {
	fmt.Print(t.value, ", ")

	if t.left  != nil {
		t.left.foldPrint()
	}
	if t.right != nil {
		t.right.foldPrint()
	}
}


func main() {
	f()
	g()
}

func f() { /*{{{*/
	tree := &Tree {
		5,
		&Tree {
			3,
			&Tree { 2, nil, nil } ,
			&Tree { 4, nil, nil } },
		&Tree {
			7,
			&Tree { 6, nil, nil } ,
			&Tree { 9, nil, nil } } }

	found := []bool {
		tree.binarySearch(6) ,
		tree.binarySearch(8) ,
		tree.binarySearch(1) }

	fmt.Println(found)
} /*}}}*/

func g() {
	tree := &Tree { 5, nil, nil }

	tree.append(6)
	tree.append(0)
	tree.append(1)
	tree.append(3)
	tree.append(2)
	tree.append(8)
	tree.append(7)
	tree.append(7)
	tree.append(9)

	tree.foldPrint()
}
