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
