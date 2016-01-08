process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', function (chunk) {
	var line = chunk.toString();
	console.log(100 - Number(line));
});
