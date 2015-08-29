interface O { o: void }
interface I { i: void }

interface And {
	(x: O, y: O) : O;
	(x: O, y: I) : O;
	(x: I, y: O) : O;
	(x: I, y: I) : I;
}

interface Or {
	(x: O, y: O) : O;
	(x: O, y: I) : I;
	(x: I, y: O) : I;
	(x: I, y: I) : I;
}

interface Not {
	(x: O) : I;
	(x: I) : O;
}

let and: And;
let or:  Or;
let not: Not;
let o:   O;
let i:   I;

let a = and(o, i);
let b = not(a)
let c = or(b, o);

let result: void = c.i;
