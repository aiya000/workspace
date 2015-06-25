using System;
using System.Linq;


public class LinqDefaultIfEmpty {
	public static void Main(string[] args){
		var xs = new [] { 1, 2, 3, 4, 5 };
		xs.DefaultIfEmpty().ToList().ForEach(Console.WriteLine);

		var ys = new [] { "a", "b", null, "d", "e" };
		ys.DefaultIfEmpty().ToList().ForEach(Console.WriteLine);

		var zs = new int[0];
		zs.DefaultIfEmpty().ToList().ForEach(Console.WriteLine);
	}
}
