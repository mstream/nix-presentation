object Hello {
  def format(personName: String) = 
    (fansi.Color.White("(Scala/SBT) ") ++
    fansi.Color.Blue("Hello ") ++
    fansi.Color.Red(personName) ++
    fansi.Color.Blue("!")).render
}
