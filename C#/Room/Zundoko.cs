using System;

public class Program {
	public static void Main(string[] args) {
		var q = new ZuQueue();
		for (;;) {
			var newFace = q.Next();
			Console.Write(newFace);
			if (q.IsSucceed()) {
				Console.WriteLine("キ・ヨ・シ！");
				break;
			}
		}
	}
}

class ZunGenerator {
	private static Random random = new Random();
	private static string[] samples = new [] { "ズン", "ドコ" };
	public static string Generate() {
		return samples[random.Next(0, 2)];
	}
}

class ZuQueue {
	private Tuple<string,string,string,string,string> result = Tuple.Create("", "", "", "", "");

	public bool IsSucceed() {
		var _1 = this.result.Item1;
		var _2 = this.result.Item2;
		var _3 = this.result.Item3;
		var _4 = this.result.Item4;
		var _5 = this.result.Item5;
		return _1 == "ズン" &&
		       _2 == "ズン" &&
		       _3 == "ズン" &&
		       _4 == "ズン" &&
		       _5 == "ドコ";
	}

	public string Next() {
		var _2 = this.result.Item2;
		var _3 = this.result.Item3;
		var _4 = this.result.Item4;
		var _5 = this.result.Item5;
		var newFace = ZunGenerator.Generate();
		this.result = Tuple.Create(_2, _3, _4, _5, newFace);
		return newFace;
	}
}
