// '\' is lambda

// \xy.x
function f(x){
	return function(_){
		return x;
	}
}

var constF = f(10);
print( constF(20) );

// same it by Function.prototype.bind
function f1(x, _){ return x; }
var constF1 = f1.bind(null, 10);
print( constF1(20) );
