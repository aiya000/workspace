function foo(hoge?: any) : boolean {
	return hoge != null;
}

console.log(foo(10));
console.log(foo());
