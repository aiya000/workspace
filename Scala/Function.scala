object Function {
	def f(): Unit = {
		println("foo");
	}
	def g(x: Int, y: Int): List[Int] = List(x, y)
	def h() = 10
	def main(args: Array[String]): Unit = {
		f;
		println(g(1, 2));
		println(h);
	}
}
