import org.scalatest.funspec.AnyFunSpec
import org.scalactic.TripleEquals._

class HelloSpec extends AnyFunSpec {
  describe("format") {
    it("formats correctly") {
      val actual = Hello.format("John") 
      assert(actual contains "(Scala/SBT)")
      assert(actual contains "Hello")
      assert(actual contains "John")
    }
  }
}
