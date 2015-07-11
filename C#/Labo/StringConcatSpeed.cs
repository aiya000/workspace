using System;
using System.Collections.Generic;
using System.Linq;
using Math  = System.Math;
using Regex = System.Text.RegularExpressions.Regex;
using System.Text;
using System.Diagnostics;


public class Test {
	public static void Main(string[] args){
		const int Count = 1500;
		var watcher = new Stopwatch();
		var rand    = new Random();

		watcher.Start();
		for (int i = 0; i < Count; ++i) {
			var s =
				"1 : " + rand.Next() +
				"2 : " + rand.Next() +
				"3 : " + rand.Next() +
				"4 : " + rand.Next() +
				"5 : " + rand.Next() +
				"6 : " + rand.Next() +
				"7 : " + rand.Next() +
				"8 : " + rand.Next() +
				"9 : " + rand.Next() +
				"10 : " + rand.Next();
			Console.WriteLine(s);
		}
		var a = watcher.Elapsed;
		watcher.Reset();

		for (int i = 0; i < Count; ++i) {
			const string s =
				"1 : {0}"  +
				"2 : {1}"  +
				"3 : {2}"  +
				"4 : {3}"  +
				"5 : {4}"  +
				"6 : {5}"  +
				"7 : {6}"  +
				"8 : {7}"  +
				"9 : {8}"  +
				"10 : {9}";
			var s1 = string.Format(s, rand.Next(), rand.Next(), rand.Next(), rand.Next(), rand.Next(), rand.Next(), rand.Next(), rand.Next(), rand.Next(), rand.Next());
			Console.WriteLine(s1);
		}
		var b = watcher.Elapsed;

		Console.WriteLine("don't use string.Format : " + a);
		Console.WriteLine("use string.Format : " + b);
	}
}
