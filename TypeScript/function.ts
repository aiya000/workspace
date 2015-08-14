function add(x : number, y : number) : number {
	return x + y;
}

//function cAdd(x : number) : number => number {
//	return function (y : number) : number {
//		return x + y;
//	};
//}

function apply(x : number, f : (y : number) => number ) : number {
	return f(x);
}

console.log(add(10, 20));
console.log(apply(10, function (y : number) : number { return y + 20; }));
