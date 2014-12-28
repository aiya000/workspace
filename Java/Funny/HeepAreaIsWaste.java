import java.util.Properties;
import java.io.*;
import java.util.function.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class HeepAreaIsWaste {
	public static void main(String[] args){
		List l = new ArrayList<Integer>();
		for(int i=0; i<5; i++)
			l.add(i);

		// l is unchecked from l0's type
		List<String> l0 = l;
		l0.add("a");
		System.out.println("ClassName: " + l0.getClass().getName());
		System.out.println("l: " + l + "\nl0: " + l0);
		System.out.println(l0.get(l0.size()-1));
		System.out.println("l: " + l + "\nl0: " + l0);
		System.out.println(l0.get(0));
	}
}
