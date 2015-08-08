using System;
using System.Collections.Generic;
using System.Diagnostics;


public class ISetSpeed {
	public static void Main(string[] args) {
		var watcher = new Stopwatch();
		var rand    = new Random();
		var xs      = new SortedSet<int>();
		var ys      = new HashSet<int>();
		var count   = rand.Next(5000);

		watcher.Start();
		for (int i = 0; i < count; ++i) {
			xs.Add(rand.Next());
		}
		var a = watcher.Elapsed;
		watcher.Reset();

		watcher.Start();
		for (int i = 0; i < count; ++i) {
			ys.Add(rand.Next());
		}
		var b = watcher.Elapsed;

		Console.WriteLine("Count: " + count);
		Console.WriteLine("SortedSet Time: " + a);
		Console.WriteLine("HashSet Time:   " + b);
	}
}
