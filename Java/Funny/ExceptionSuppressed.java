
public class ExceptionSuppressed {
	public static void main(String[] args){
		class A implements AutoCloseable {
			@Override
			public void close() throws Exception {
				throw new Exception("hoge");
			}
		};
		try{
			try(A a = new A();A b = new A()){
				throw new Exception("normal");
			}catch(Exception e){
				System.out.println(e.toString());
				e.addSuppressed(new Exception());
			}
		}catch(Exception e){
			System.out.println(e);
		}
	}
}
