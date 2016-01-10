import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Main {
	public static void main(String[] args) throws Exception {
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		int y = 0, n = 0;
		for (int i = 0; i < 5; ++i) {
			String line = in.readLine();
			if (line.equals("yes")) {
				++y;
			} else {
				++n;
			}
		}
		System.out.println((y > n) ? "yes" : "no");
	}
}
