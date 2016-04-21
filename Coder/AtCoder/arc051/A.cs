// Incompleted
using System;
using System.Linq;

static class Debugger {
	public static void PrintTable(this int[][] table) {
		var i = -(A.Range / 2);
		table.ToList().ForEach(xs => {
			Console.Write(i++ + "\t");
			xs.ToList().ForEach(Console.Write);
			Console.WriteLine();
		});
	}
}

class A {
	public const int Range = 21;
	private const int HalfRange = 10;
	public static void Main(string[] args) {
		var table = new int[Range][];
		for (var i = 0; i < Range; ++i) {
			table[i] = new int[Range];
		}
		var xs = Console.ReadLine()
			.Split(' ')
			.Select(int.Parse);
		var ys = Console.ReadLine()
			.Split(' ')
			.Select(int.Parse);
		var x1 = xs.ElementAt(0) + HalfRange;
		var y1 = xs.ElementAt(1) + HalfRange;
		var r  = xs.ElementAt(2);
		var x2 = ys.ElementAt(0) + HalfRange;
		var y2 = ys.ElementAt(1) + HalfRange;
		var x3 = ys.ElementAt(2) + HalfRange;
		var y3 = ys.ElementAt(3) + HalfRange;

		DrawSpread(table, x1, y1, r + 1);
		DrawBetween(table, x2, x3, y2, y3);
		table[x1][y1] = 5;
		table.PrintTable();

		var ans1 = table[HalfRange + 1].Any(z => z == 1);
		Console.WriteLine(ans1 ? "YES" : "NO");
		var ans2 = table[HalfRange + 2].Any(z => z == 2);
		Console.WriteLine(ans2 ? "YES" : "NO");
	}

	private static void DrawSpread(int[][] table, int x, int y, int rest) {
		if (rest <= 0) {
			return;
		}
		if (x < 0 || y < 0) {
			return;
		}
		if (x > Range - 1 || y > Range - 1) {
			return;
		}
		if (table[x][y] == 1) {
			return;
		}

		table[x][y] = 1;
		DrawSpread(table, x - 1, y - 1, rest - 2);
		DrawSpread(table, x - 1, y,     rest - 1);
		DrawSpread(table, x - 1, y + 1, rest - 2);
		DrawSpread(table, x,     y - 1, rest - 1);
		//DrawSpread(table, x,     y,     rest - 1);
		DrawSpread(table, x,     y + 1, rest - 1);
		DrawSpread(table, x + 1, y - 1, rest - 2);
		DrawSpread(table, x + 1, y,     rest - 1);
		DrawSpread(table, x + 1, y + 1, rest - 2);
	}

	private static void DrawBetween(int[][] table, int x2, int x3, int y2, int y3) {
		var xRange = Enumerable.Range(x2, x3 - x2);
		var yRange = Enumerable.Range(y2, y3 - y2);
		xRange.ToList().ForEach(x => yRange.ToList().ForEach(y => {
			table[x][y] += 2;
		}));
	}
}
