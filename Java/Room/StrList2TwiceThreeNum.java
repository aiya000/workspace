// http://www.slideshare.net/kentaromaeda581/java8-40752729?related=2
// P24

import java.util.Arrays;
import java.util.stream.Stream;


public class StrList2TwiceThreeNum {

	private static final String[] sList = {
		  "hoge"
		, "13"
		, "foo"
		, "22"
		, "2ahoge"
		, "3O"
	};

	private static boolean isIntStr(String s){
		try{
			Integer.parseInt(s);
			return true;
		}catch(NumberFormatException e){
			return false;
		}
	}

	public static void main(String[] args){
		// my answer
		Arrays.stream(sList)
			.filter(StrList2TwiceThreeNum::isIntStr)
			.map(Integer::parseInt)
			.map(n -> n * 3)
			.forEach(System.out::println);

		System.out.println("- - -");

		// true answer
		Arrays.stream(sList)
			.filter(s -> s.matches("[-+]?\\d+"))
			.map(Integer::parseInt)
			.filter(n -> n >= 0)
			.map(n -> n * 3)
			.forEach(System.out::println);
	}
}
