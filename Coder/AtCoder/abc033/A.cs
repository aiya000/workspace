using System;
using System.Linq;

class A {
	public static void Main(string[] args) {
		var ans = Console.ReadLine()
			.ToCharArray()
			.Aggregate((a,b) => a == b ? a : 'a')
			== 'a' ? "DIFFERENT" : "SAME";
		Console.WriteLine(ans);
	}
}
