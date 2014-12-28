using System;
using System.Collections.Generic;

class Program {
	public static IEnumerable<int> FromTo(int from, int to){
		while(from <= to)
			yield return from++;
	}

	public static void Main(string[] args){
		Console.WriteLine("Hello, world!!");

		int x = 10;
		string s = "20";
		var v = 30.0f;
		const double d = 40.0;

		Console.WriteLine(@"{0} {1} {2} {3}", x, s, v, d);

		try{
			checked{
				sbyte b = 0x7f;
				b++;
			}
		}catch(OverflowException e){
			Console.WriteLine(e.Message);
			Console.WriteLine(Environment.StackTrace);
		}
		try{
			sbyte b = 0x7f;
			b = (sbyte)unchecked(b+1);
		}catch(OverflowException e){
			Console.WriteLine(e.Message);
			Console.WriteLine(Environment.StackTrace);
		}

		foreach(var view in new[]{1,2,3})
			Console.Write(view + " ");
		Console.WriteLine();

		goto DONOT_USING;
		Console.WriteLine("JUMP!!");
DONOT_USING:
		Console.WriteLine("GoTo");

		foreach(int view in FromTo(0, 10))
			Console.Write(view + " ");
		Console.WriteLine();

	}
}
