// extends
class A {
	public constructor() {
		console.log("bau!! => A");
	}
	public foo() : void {
		console.log("A#foo()");
	}
}
class B extends A {
	public constructor() {
		super();
		console.log("and > bau!! => B");
	}
	public foo() : void {
		console.log("B#foo()");
	}
}

var b: B = new B();
b.foo();
