// '_' is deprecated (see http://yume-build.com/blog/archives/292)

// basic
var __ = require('underscore');
var x  = __([1, 2, 3, 4, 5]).shuffle();
var y  = __.shuffle([1, 2, 3, 4, 5]);
console.log(x, y);

// method chain
__.chain([1, 2, 3, 4, 5])
	.map(function (x) { return x % 2 })
	.each(function (x) { console.log(x); });

var ys = __.chain([1, 2, 3, 4, 5])
	.map(function (x) { return x * 10; });
console.log(ys);

var zs = __.chain([1, 2, 3, 4, 5])
	.map(function (x) {
		return (x % 15 == 0) ? 'FIzzBuss'
		     : (x % 5  == 0) ? 'Fizz'
		     : (x % 3  == 0) ? 'Buzz'
		                     : String(x);
	})
	.value();
console.log(zs);
