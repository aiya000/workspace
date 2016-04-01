using System;
using System.Collections.Generic;
using System.Linq;

static class MuseSaying {
	public static IEnumerable<string[]> SayInfinite() {
		while(true) {
			yield return new [] {
				  "ファイトだよ！"
				, "ﾗﾌﾞｱﾛｰｼｭｰﾄｯ!!"
				, "ﾖｷﾆﾊｶﾗｴﾐﾅﾉｼｭｰ!"
				, "ﾀﾞﾚｶﾀｽｹﾃｰ!!"
				, "にゃー！！"
				, "ｲﾐﾜｶﾝﾅｲ!!"
				, "にっこにっこにー！"
				, "ぷしゅっ！"
				, "ﾊﾗｼｮｰ"
			}
			.Select(x => string.Format(@"\{0}/", x))
			.ToArray();
		}
	}
	public static IEnumerable<T> Shuffle<T>(this IEnumerable<T> xs) {
		return xs.OrderBy(_ => Guid.NewGuid());
	}
}

class Muse {
	public static void Main(string[] args) {
		MuseSaying.SayInfinite()
			.Select(xs => xs.Shuffle())
			.Take(100)
			.ToList().ForEach(xs => xs.ToList().ForEach(Console.WriteLine));
	}
}
