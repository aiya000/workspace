// NG Source
using System;
using System.Linq;

class Carrot {
	public int Volume;
	public int Sugar;
}

public class Hello {
	public static void Main() {
		var foo = Console.ReadLine().Split(' ');
		var n = int.Parse(foo[0]);
		var s = int.Parse(foo[1]);
		var p = int.Parse(foo[2]);
		Func<Carrot, bool> carrotOK = i => s - p <= i.Sugar && i.Sugar <= s + p;
		var carrots = Enumerable.Range(0, n).Select(_ => {
			var bar = Console.ReadLine().Split(' ');
			return new Carrot() {
				  Volume = int.Parse(bar[0])
				, Sugar  = int.Parse(bar[1])
			};
		}).ToArray();

		var okCarrots = Enumerable.Range(0, carrots.Length)
			.Select(i => Tuple.Create(i, carrots[i]))
			.Where(x => carrotOK(x.Item2));
		var unit = new Carrot() {
			  Volume = 0
			, Sugar  = 0
		};
		var foundNum = -1;
		foreach (var caro in okCarrots) {
			if (unit.Volume <= caro.Item2.Volume) {
				foundNum = caro.Item1;
			}
		}
		if (foundNum == -1) {
			Console.WriteLine("not found");
		} else {
			Console.WriteLine(foundNum);
		}
	}
}
