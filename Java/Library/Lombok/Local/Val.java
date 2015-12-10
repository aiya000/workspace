import lombok.*;
import java.util.*;

public class Val {
	public static void main(String[] args) {
		val list = new ArrayList<Integer>() {{
			this.add(10); this.add(20); this.add(30);
		}};
		for (val x : list) {
			System.out.println(x);
		}
	}
}
