proces.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', main);

function main(chunk) {
	var line = chunk.toString();
	console.log("XXXXXX");
}
