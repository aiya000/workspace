import scala.collection.immutable.Map

object Main {
    def main(args: Array[String]): Unit = {
        val a = Map( "aho"  -> "ge"
                   , "baka" -> "aho"
                   )
        val x = a.get("baka").map(_ + "ge")
        println(x)
    }
}
