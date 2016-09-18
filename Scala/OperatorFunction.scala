case class WrappedString(val x: String) {
    // append needs one argument
    def append(y: String): WrappedString = WrappedString(x + y)
}

object OperatorFunction {
    def main(args: Array[String]): Unit = {
        val x = WrappedString("super ")
        val y = x append "ahoge"
        println(y)
    }
}
