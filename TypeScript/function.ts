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

console.log(add(10, 20));
console.log(cAdd(10)(20));
console.log(apply(10, function (y: number) : number { return y + 20; }));
console.log(sub(10));
console.log(identity("a"));
console.log(identity<number>(10));
//console.log(identity<string>(20));
