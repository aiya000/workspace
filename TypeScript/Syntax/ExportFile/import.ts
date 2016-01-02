// $ tsc import.ts --module commonjs
import Export = require('./export');

let foo = new Export.Foo(10);
console.log(foo.x);
