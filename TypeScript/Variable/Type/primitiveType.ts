// primitive types
var n: number  = 10;
var m          = 20;   // type inference
var b: boolean = true;
var c: string  = 'a';  // char is nothing
var s: string  = "type!! yatta!!!";
var x          = null;
var y          = undefined; // can eval
var z: any     = 30; // include all types
console.log(n, m, b, c, s, x, y, z);

// multi declare
var t: number = 40, u = 50;
var v: number = 60, w: string = "foo";
console.log(t, u);
console.log(v, w);

// object literal
var o: { n: number } = { n: 10 };
var p                = { n: 20 };
var q: { n: number, m: number } = { n: 30, m: 40 };
var r: { n: number; m: number } = { n: 50, m: 60 };
console.log(o, p);
console.log(q, r);

// must be declared
//console.log(undeclared);
