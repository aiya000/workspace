// simply
interface A {
	field    : number;  // can define field
	method() : void;
}

// extends
interface B extends A {
	[index: number] : number; // indexer
}

// implementes
class C implements B {
	[index: number] : number;
	public field    : number;
	public method() : void {
		console.log("C#method()");
	}
}
var b: B = new C();
b.method();
console.log(b[0]);  // undefined
