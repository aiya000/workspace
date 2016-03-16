public class MemoizedFibonacci {
	private static int fibonacci(int n) {
		int[] fibo = new int[n + 1];
		fibo[0] = 1;
		fibo[1] = 1;
		for (int i = 2; i <= n; ++i) {
			fibo[i] = fibo[i - 2] + fibo[i - 1];
		}
		return fibo[n];
	}
	public static void main(String[] args) {
		System.out.println(fibonacci(6));
		System.out.println(fibonacci(45));
	}
}
