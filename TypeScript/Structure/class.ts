// simply
class Dog {
	name: string;
	bau:  string;
}
var pero: Dog = { name: "pero", bau: "anyanya!!" };
console.log("(" + pero.name + ")< " + pero.bau);

// capsule
class Mew {
	private name:  string;
	private power: number;
	public constructor(name: string, power: number) {
		this.name  = name;
		this.power = power;
	}
	public attack() : void {
		console.log("oops!! (" + this.power + " damage)");
	}
}
//var pota: Mew = { name: "pota", power: 100 };
var pota: Mew = new Mew("pota", 100);
console.log(pota);
pota.attack();


// indexer
class Indexer {
	[index: number]: number;
	public constructor() {
		this[0] = 10;
		this[1] = 20;
		this[2] = 30;
	}
}

var indexer: Indexer = new Indexer();
console.log(indexer[0]);

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

// generic
class Identity<T> {
	private id: T;
	public constructor(id: T) {
		this.id = id;
	}
	public get() : T {
		return this.id;
	}
}
var identity = new Identity(10);
console.log(identity.get());
