import scala.language.implicitConversions


object ImplicitConversion {
    // method extension
    implicit class WrappedString(val str: String) {
        def ahoge: String = str + " is ahoge"
    }

    // type conversion
    implicit def wToS(x: WrappedString): String = x.str
    def identityString(x: String): String = x

    def main(args: Array[String]): Unit = {
        println("He".ahoge)
        val x = new WrappedString("ahoge")
        println(identityString(x))
    }
}
