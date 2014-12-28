import java.util.Optional;
import java.util.stream.*;


public class FizzBuzz8 {
	public static void main(String[] args){
		Stream.iterate(1, n -> n+1)
			.map(
				n -> n + ": " + ((n%3)==0 ? (n%5)==0 ? "FizzBuzz"
				                          : "Buzz"
				                          : (n%5)==0 ? "Fizz"
				                                     : ""
				                )
			).limit(30)
			.forEach(System.out::println);
	}
}
