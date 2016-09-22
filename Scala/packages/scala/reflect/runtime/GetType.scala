import scala.reflect.runtime.{universe => ru}
import ru._


object GetType {
    def getType[A : TypeTag](x: A): Type = typeOf[A]

    def main(args: Array[String]): Unit = {
        println(getType(10))
        println(getType("ahoge"))
        println(getType(List()))
    }
}
