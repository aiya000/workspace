import java.util.Properties;
import java.io.*;

public class Test {
	public static void main(String[] args){
		Properties prop = new Properties();
		prop.setProperty("key", "value");

		try(FileOutputStream out = new FileOutputStream("Test.properties")){
			prop.store(out, "comment");
		}catch(IOException e){
			e.printStackTrace();
		}

		Properties prop0 = new Properties();
		try(FileInputStream in = new FileInputStream("Test.properties")){
			prop0.load(in);
		}catch(IOException e){
			e.printStackTrace();
		}
		String value = prop0.getProperty("key");
		System.out.println(value);
	}
}
