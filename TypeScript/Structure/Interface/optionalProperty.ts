// optional property
interface Geometry {
	height : number;
	width  : number;
	depth? : number;
}

function areaSize(geo: Geometry) {
	return geo.depth ? geo.height * geo.width * geo.depth
	                 : geo.height * geo.width;
}

var square:    Geometry = { height: 10, width: 20 };
var rectangle: Geometry = { height: 10, width: 20, depth: 30 };
console.log(square, areaSize(square));
console.log(rectangle, areaSize(rectangle));
