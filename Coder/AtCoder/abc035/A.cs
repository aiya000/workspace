using System;
using System.Linq;

class A {
	public static void Main(string[] args) {
		var xs = Console.ReadLine()
			.Split(' ')
			.Select(s => int.Parse(s))
			.ToArray();
		var b = (xs[0] % 16 == 0 && xs[1] % 9 == 0);
		Console.WriteLine(b ? "16:9" : "4:3");
	}
}
