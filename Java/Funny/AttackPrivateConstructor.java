import java.lang.reflect.Constructor;

import java.util.Objects;

public class AttackPrivateConstructor {
	public static void main(String[] args){
		Class<Objects> classLoader = Objects.class;
		Constructor[] constructors = classLoader.getDeclaredConstructors();
		try{
			constructors[0].setAccessible(true);
			constructors[0].newInstance(new Object[0]);
		}catch(ReflectiveOperationException e){
			System.out.println(e.getCause());
		}
	}
}
