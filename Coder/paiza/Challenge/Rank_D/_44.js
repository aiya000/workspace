process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', main);

function main(chunk){
	var n = parseInt(chunk, 10) + 1;
	console.log( Array(n).join("*") );
}
