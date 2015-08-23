// different functions
var f: Function = () => {};
var g: Function = (n: number) => {};
f = (n: number, m: number) => {};

// numeric types
var x: number = 10;
x = 20.0;

// isomorphsm
class A {
	x: number;
	constructor(x: number) {
		this.x = x;
	}
}
class B {
	x: number;
	constructor(x: number) {
		this.x = x;
	}
}
var x0: A = new A(10);
var y0: B = new B(20);
x0        = y0;
y0        = { x: 30 };
var z0: A = new B(40);

// unexpected field
var x1: { x:number } = { x: 10, y: 10 };
