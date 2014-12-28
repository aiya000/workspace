import java.io.*;
import java.util.*;
import java.util.function.*;
import java.util.Optional;
import java.util.stream.*;
import java.lang.reflect.Constructor;

public class Test {
	public static void main(String[] args){
		try{
			Constructor<?> c =
				Optional.of(10).getClass()
					.getDeclaredConstructors()[0];
			c.setAccessible(true);
			System.out.println(c.newInstance());
		}catch(ReflectiveOperationException e){
			e.printStackTrace();
		}
	}
}
