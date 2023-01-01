object Main {
  def main(args: Array[String]) = {
    if (args.length == 0) {
      println("The \"person name\" path parameter should be provided.")
      System.exit(1)
    } else {
      val personName = args(0)
      println(Hello.format(personName))
    }
  }
}
