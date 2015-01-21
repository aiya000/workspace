
import java.util.*;

public class PECS_UnderOver {
	static class A {};
	static class B extends A {};
	static class C extends B {};
	private static void hoge(List<? extends B> list){
		List<B> l = new ArrayList<>();
		l.add(list.get(0));
		System.out.println(l);
	}
	public static void main(String[] args){
		List<? extends B> list = Arrays.asList(new B(), new C());
		System.out.println(list.get(0));

		List<B> l = Arrays.asList(new B());
		hoge(l);
	}
}
