import scala.util.parsing.json._

object Main {
    val json: Option[Any] = JSON.parseFull("""
    {
        "key1" : "string",
        "key2" : 20,
        "key3" : ["Array",1],
        "key4" : {
            "key5" : "hoge"
        }
    }
    """)

    def main(args: Array[String]): Unit = {
        println(json)
        println()
        json.map({x =>
            for ((key,value) <- x.asInstanceOf[Map[String,Any]].iterator) {
                println(key, value)
            }
        })
    }
}
