
Array.prototype.distinct = function(){
	var list = [];
	for each(var x in this){
		var exists = false;

		for each(var y in list){
			if(x == y){
				exists = true;
				break;
			}
		}

		if(!exists){
			list.push(x);
		}
	}

	return list;
}

Array.prototype.countIt = function(it){
	var count = 0;

	for each(var x in this){
		if(x == it){
			count++;
		}
	}

	return count;
}

function main(){
	var data = "Nagato Yukikaze Akagi Kitakami Nagato Akagi Akagi Kitakami";
	var list = data.split(" ");

	var names = list.distinct();

	var results = [];
	for each(var name in names){
		var n = list.countIt(name);
		results.push(name + " " + n);
	}

	results.slice(0, names.length).forEach(function(x){ print(x); });
}

main();
