// basics
enum Foo { A, B, C }
var x: Foo    = Foo.A;
var y: number = Foo.B;
console.log(x, y);

// enumerate numbers
enum Hoge { A, B = 10, C }
var v = Hoge.A;
var w = Hoge.B;
var z = Hoge.C;
console.log(v, w, z);

// get key as string by index
var o: string = Hoge[0];
var p         = Hoge[10];
console.log(o, p);

// add key without value
Hoge[12] = "D";
var q = Hoge[12];
console.log(q);
//var r = Hoge.D;  // cannot get by direct
console.log(Hoge);
