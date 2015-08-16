// normally
function add(x: number, y: number) : number {
	return x + y;
}

// curry function
function cAdd(x: number) {
	return function (y: number) : number {
		return x + y;
	};
}

// function argument
function apply(x: number, f: (y: number) => number) : number {
	return f(x);
}

// default value of argument
function sub(x: number, y = 20) : number {
	return x - y;
}

// generic function
function identity<T>(x: T) : T {
	return x;
}

// function type
interface Identity {
	(x:number) : number;
}
function modify(id: Identity, x: number) : number {
	return sub(id(x));
}

// variant argument
function variantArgument(...xs: number[]) : number {
	return xs.reduce((ac,x) => ac + x);
}

console.log(add(10, 20));
console.log(cAdd(10)(20));
console.log(apply(10, function (y: number) : number { return y + 20; }));
console.log(sub(10));
console.log(identity("a"));
console.log(identity<number>(10));
//console.log(identity<string>(20));
console.log(modify(x => x, 300));
console.log(variantArgument(10, 20, 30));
