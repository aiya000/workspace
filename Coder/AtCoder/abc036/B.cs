using System;
using System.Linq;

class B {
	public static void Main(string[] args) {
		var n = int.Parse(Console.ReadLine());
		var table = Enumerable.Range(1, n)
			.Select(_ => Console.ReadLine().ToCharArray())
			.ToArray();
		for (var x = 0; x < table.Length; ++x) {
			for (var y = table[0].Length - 1; y >= 0; --y) {
				Console.Write(table[y][x]);
			}
			Console.WriteLine();
		}
	}
}
