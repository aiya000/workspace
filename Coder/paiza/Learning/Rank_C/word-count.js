process.stdin.resume();
process.stdin.setEncoding('utf8');
process.stdin.on('data', main);


Array.prototype.distinct = function(){
	var list = [];
	for(var i=0; i<this.length; i++){
		var exists = false;

		for(var j=0; j<list.length; j++){
			if(this[i] == list[j]){
				exists = true;
				break;
			}
		}

		if(!exists){
			list.push(this[i]);
		}
	}

	return list;
}

Array.prototype.countIt = function(it){
	var count = 0;

	for(var i=0; i<this.length; i++){
		if(this[i] == it){
			count++;
		}
	}

	return count;
}

function main(chunk){
	var data = chunk.toString();
	var list = data.replace("\n", "").split(" ");

	var names = list.distinct();

	var results = [];
	for(var i=0; i<names.length; i++){
		var n = list.countIt(names[i]);
		results.push(names[i] + " " + n);
	}

	for(var i=0; i<results.length; i++){
		console.log(results[i]);
	}
}
