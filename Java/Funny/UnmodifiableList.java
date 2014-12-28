import java.util.List;
import java.util.Collections;
import java.util.Arrays;

/**
 * @author ishikawa/aiya000
 * @since  2014/05/22
 */

public class UnmodifiableList {

	/* 要素ごと変更不可能なリスト */
	//private class ConstList<T> {
	//	private final List<T> LIST;
	//	public ConstList(T... items){
	//		 this.LIST = Collections.unmodifiableList(
	//				Arrays.asList(items));
	//	}
	//	public T get(int i){ return LIST.get(i); }
	//}
	private final List<String> LIST = Collections.unmodifiableList(Arrays.asList("a", "b", "c"));

	public static void main(String[] args){ new UnmodifiableList(); }
	public void main(){
		//ConstList<String> constList = new ConstList<>(new String[]{"a", "b", "c"});
		//System.out.println( constList.get(0) );

		// ん？ なんかこのクラス、標準出力に出力できないのだけど。
		System.out.println( LIST.get(0) );
	}

}
