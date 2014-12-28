using System;
using System.Collections.Generic;
using System.Linq;


public class Hello {
	public static void Main(string[] args){
		var a = Console.ReadLine()
		               .Split(' ')
		               .Select(s => int.Parse(s))
		               .ToArray();

		int actLen = a[0];
		int comLen = a[1];

		var b = Enumerable.Range(0, comLen)
		                  .Select(n => int.Parse(Console.ReadLine()));

		var b1 = b.Skip(1);
		var b2 = b.Skip(2);

		var c  = b.Zip(b1, (x,y) => Tuple.Create(x,y));
		var c1 = c.Zip(b2, (x,y) => Tuple.Create(x.Item1, x.Item2, y));

		var results = c1.Aggregate(new List<int>(), (ac,x) => {
				ac.Add(x.Item1 + x.Item2 + x.Item3);
				return ac;
		});

		int ans = results.Aggregate(0, (x,y) => Math.Max(x,y));

		Console.WriteLine(ans);
	}
}
