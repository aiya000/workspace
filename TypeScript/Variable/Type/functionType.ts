// function type
var f: () => void = function () : void { console.log("void"); };
f();
var g: () => void = () => console.log("void");
g();
