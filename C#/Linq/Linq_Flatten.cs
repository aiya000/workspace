using System;
using System.Linq;


public class Test {
	public static void Main(string[] args){
		var a = new int[][]{new int[]{1,2}, new int[]{3,4}};
		var b = a.SelectMany(n => n);
		foreach (var x in b) {
			Console.WriteLine(x);
		}
	}
}
