import java.util.stream.*;

public class Divisor {
	public static void main(String[] args){
		divisorNum()
			.limit(10)
			.forEach(n -> System.out.println(n + " "));
	}

	private static IntStream divisorNum(){
		IntStream list = IntStream.iterate(3, n -> n+2);
		return list;
	}
}
