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

// optional property
interface Geometry {
	height : number;
	width  : number;
	depth? : number;
}
function areaSize(geo: Geometry) {
	return geo.depth ? geo.height * geo.width * geo.depth
	                 : geo.height * geo.width;
}
var square:    Geometry = { height: 10, width: 20 };
var rectangle: Geometry = { height: 10, width: 20, depth: 30 };
console.log(square, areaSize(square));
console.log(rectangle, areaSize(rectangle));

// function type
interface Func {
	(x: number, y:number) : number;
}
var f: Func = (x,y) => x + y;
console.log(f(10, 20));
