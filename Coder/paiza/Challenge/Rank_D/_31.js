process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', main);

function map(f, xs){
	var _xs = [];
	for(var i=0; i<xs.length; i++){
		_xs.push( f(xs[i]) );
	}
	return _xs;
}

function main(chunk) {
	var data = chunk.toString();

	var nats = data.split(" ").map(Number);
	var a = nats[0], b = nats[1];

	console.log( a == b ? "eq"
	           : a >= b ? a : b );
}
