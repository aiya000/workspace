import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

import java.util.StringJoiner;


public class Main {
	public static void main(String[] args) throws IOException {
		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
		StringJoiner s = new StringJoiner(",", "", ".");

		int inputNum = Integer.parseInt(in.readLine());
		for(int i=0; i<inputNum; i++)
			s.add(in.readLine());
		System.out.println("Hello " + s.toString());
	}
}
