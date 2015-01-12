import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.stream.IntStream;
import java.util.stream.Collectors;

//public class Main {
public class _34 {
	public static void main(String[] args) throws IOException {
		int mult = Integer.parseInt(
				new BufferedReader(new InputStreamReader(System.in))
				.readLine());
		int[] a = IntStream.range(1, 10).map(n -> n * mult)
			.toArray();

		int i;
		for(i=0; i<a.length-1; i++)
			System.out.print(a[i] + " ");
		System.out.println(a[i]);
	}
}
