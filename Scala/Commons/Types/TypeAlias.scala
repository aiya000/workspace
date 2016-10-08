object TypeAlias {
    type O = Option[Int]
    type E[A] = Either[String, A]
    def main(args: Array[String]): Unit = {
        val x: O = Some(10)
        println(x)
        val y: E[Int] = Left("ahoge")
        val z: E[Int] = Right(10)
        println(y, z)
    }
}
