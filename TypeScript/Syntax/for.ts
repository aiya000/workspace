// enumerate propertis name
class A {
	x: number;
	y: number;
	z: number;
}

var a = new A();
a.x = 10;
a.y = 20;
a.z = 30;

for (var x in a) {
	console.log(x);
	x = 10;
}
