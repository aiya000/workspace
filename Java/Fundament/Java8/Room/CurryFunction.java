import java.util.function.Function;
import java.util.function.BiFunction;


public class CurryFunction {
	public static void main(String[] args){
		// \x.\y.x+y
		Function<Integer, Function<Integer, Integer>> f = x -> y -> x + y;
		System.out.println( f.apply(10).apply(20) );
	}
}
