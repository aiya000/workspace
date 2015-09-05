/// <reference path="./declareNamespace2.ts"/>

/**
 * @namespace
 */
module Foo {
	export const BAR: number = 10;
}

/**
 * @namespace
 */
namespace Mew {
	export const NEKO: string = "neko";
}

var aho  = Foo.BAZ;
var hoge = Foo.BAR;
var inu  = Mew.MEU;
var lion = Mew.NEKO;

console.log(Foo, Mew);
console.log(aho, hoge);
console.log(inu, lion);
