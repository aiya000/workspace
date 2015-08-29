/// <reference path="typings/angularjs/angular.d.ts"/>
class Neko {
	private _mew: string;
	public constructor(mew: string) {
		this._mew = mew;
	}
	get mew() : string {
		return this._mew;
	}
}

let appHello = angular.module("appHello", []);
appHello.factory("onLoad", [() : Neko => {
	let nekoSan = new Neko("neko_thunder !!");
	return nekoSan;
}]);
appHello.run(["onLoad", (neko : Neko) : void => {
	alert(neko.mew)
}]);
