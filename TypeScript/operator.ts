// delete property
var x = { foo : "foo", bar : 10 };
delete x.foo;
console.log(x.foo);  // undefined
console.log(x.bar);

// return undefined
console.log(void 10);

// return type name
console.log( typeof 10
           , typeof (() => {})
           , typeof ((x:number) => {})
           );

var f = () => (1, 2);  // (,) return second value (C like)
console.log(f());      // It is not a tuple. HAHAHA!!

// foo instance of Hoge
class A {}
console.log(new A() instanceof A);
