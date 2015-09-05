class Foo {
	constructor(private meu: string) {}
	public moeOkoshi() {
		console.log(this.meu + this.meu);
	}
}

var foo = new Foo("meu");
foo.moeOkoshi();
