// define in a namespace
namespace Foo {
	export const NUMBER: number = 100;
	export class Bar {}
	const HIDDEN: number = 10;
}
console.log(Foo.NUMBER);
//console.log(Foo.HIDDEN);

// import from a namespace as different name
import Ahoge = Foo.Bar;
console.log(new Ahoge());
