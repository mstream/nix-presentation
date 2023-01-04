import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class HelloTest {
  @Test
  void format() {
    String actual = Hello.format("John");
    assertTrue(actual.contains("(Java/SBT)"));
    assertTrue(actual.contains("Hello"));
    assertTrue(actual.contains("John"));
  }
}
