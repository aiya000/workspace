import java.util.Scanner;

public class _47 {
	public static void main(String[] args){
		try(Scanner in = new Scanner(System.in)){
			int n = in.nextInt();
			String a = n % 2 == 0 ? "even" : "odd";

			System.out.println(a);
		}
	}
}
