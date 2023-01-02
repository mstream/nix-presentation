import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class HelloTest {
  @Test
  void format() {
    assertEquals(
      "(Java/SBT) Hello John!", 
      Hello.format("John")
    );
  }
}
