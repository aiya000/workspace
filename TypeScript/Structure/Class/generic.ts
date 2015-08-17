// generic
class Identity<T> {
	private id: T;
	public constructor(id: T) {
		this.id = id;
	}
	public get() : T {
		return this.id;
	}
}
var identity = new Identity(10);
console.log(identity.get());
