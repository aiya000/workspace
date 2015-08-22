class Foo {
	private sideEffect: number = 0;
	private _elem:      number;

	get elem() : number {
		++this.sideEffect;
		return this._elem;
	}
	set elem(value: number) {
		--this.sideEffect;
		this._elem = value;
	}

	public getCount() : number {
		return this.sideEffect;
	}
}

var foo = new Foo();
foo.elem = 10;
foo.elem = 20;
console.log(foo.getCount());
console.log(foo.elem);
console.log(foo.getCount());
console.log(foo.elem);
console.log(foo.getCount());
