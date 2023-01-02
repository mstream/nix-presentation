import org.scalatest.funspec.AnyFunSpec
import org.scalactic.TripleEquals._

class HelloSpec extends AnyFunSpec {
  describe("format") {
    it("formats correctly") {
      val actual = Hello.format("John") 
      val expected = "(Scala/SBT) Hello John!"
      assert(actual === expected)
    }
  }
}
