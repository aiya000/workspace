using System;
using System.Linq;
using System.Collections.Generic;

static class Aho {
	public static IEnumerable<int> GeoPro(int x) {
		var y = x;
		yield return y;
		while (true) {
			yield return y += x;
		}
	}
}

class A {
	public static void Main(string[] args) {
		var a   = int.Parse(Console.ReadLine());
		var b   = int.Parse(Console.ReadLine());
		var n   = int.Parse(Console.ReadLine());
		var ans = Aho.GeoPro(a)
			.Where(x => x >= n && x % b == 0)
			.First();
		Console.WriteLine(ans);
	}
}
