class Indexer {
	// indexer
	[index: number]: number;

	public constructor() {
		this[0] = 10;
		this[1] = 20;
		this[2] = 30;
	}
}

var indexer: Indexer = new Indexer();
console.log(indexer[0]);
