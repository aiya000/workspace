import java.util.Properties;
import java.io.*;

public class NeoEnumerate {
	public static void main(String[] args){
		new NeoEnumerate().go();
	}

	public static enum Enum {
		hoge("hoge"),
		foo("foo");

		private String v;
		private Enum(String v){ this.v = v; }
		public String get(){ return this.v; }
	}

	public void go(){
		Enum a = Enum.hoge;
		System.out.println(a.get());
	}
}
