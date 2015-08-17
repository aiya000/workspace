// function type
interface Func {
	(x: number, y:number) : number;
}
var f: Func = (x,y) => x + y;
console.log(f(10, 20));
