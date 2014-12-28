
/**
 * @author  aiya000
 * @since   2014/05/22
 * @version jdk1.8.0
 */

class Tuples {
	public static class Tuple<F,S> {
		public F fst;
		public S snd;
		public Tuple(F fst, S snd){
			this.fst = fst;
			this.snd = snd;
		}

		// これはジェネリクスの練習用であってぜんぜんべんりじゃなかったごめん。
		public static<F1,S1> Tuple<F1,S1> makeT(F1 fst, S1 snd){
			return new Tuple<F1,S1>(fst, snd);
		}
	}
}


public class MakeTuples {
	public static void main(String[] args){
		// 残念、型エラーだ。多分型エラー、そもそも解釈ができてなさそう。
		//Tuple<String,Integer> tuple0 = makeT<String,Integer>("A", 10);
		//System.out.println(tuple0.fst + " : " + tuple0.snd);

		Tuples.Tuple<String,Integer> tuple1 = new Tuples.Tuple<>("A", 10);
		System.out.println(tuple1.fst + " : " + tuple1.snd);
	}
}

