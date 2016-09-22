import scala.util.Try

object Throws {
    // @throws generate throws sentence to compiled bytecode
    @throws (classOf[RuntimeException])
    def f = throw new RuntimeException

    def main(args: Array[String]): Unit = {
        val x = Try(f)
        println(x)
    }
}
