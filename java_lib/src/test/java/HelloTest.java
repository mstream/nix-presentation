import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class HelloTest {
  @Test
  void format() {
    assertEquals(
      "(Java) Hello John!", 
      Hello.format("John")
    );
  }
}
