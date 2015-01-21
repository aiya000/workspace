import java.util.Deque;
import java.util.ArrayDeque;

public class Deque_Using {
	public static void main(String[] args){
		Deque<Integer> q = new ArrayDeque<>();
		q.addLast(10);
		q.addLast(20);
		q.addLast(30);
		System.out.println(q);
		System.out.println(q.pollFirst());
		System.out.println(q.pollFirst());
		System.out.println(q.pollLast());
		System.out.println(q.pollLast());
		System.out.println(q);
		q.add(40);
		System.out.println(q);
		System.out.println(q.removeFirst());
		System.out.println(q.removeFirst());
	}
}
