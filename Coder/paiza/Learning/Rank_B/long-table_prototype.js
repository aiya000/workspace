
Array.prototype.init = function(){
	return this.slice(0, this.length-1);
};

Array.prototype.map = function(f){
	var _xs = [];
	for(var i=0; i<this.length; i++){
		_xs.push( f(this[i]) );
	}
	return _xs;
};

function main(chunk){
	var lines = chunk.split("\n").init();
	var [n,m] = lines[0].split(" ").map(parseInt.bind(null, 10));

	var persons = lines.slice(1, m+1)
	                   .map(function(x){ return x.split(" "); });
	print(persons);
}

main("6 3\n" +
     "3 2\n" +
     "1 6\n" +
     "2 5\n");
