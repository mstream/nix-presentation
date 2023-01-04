import static com.diogonunes.jcolor.Ansi.colorize;
import static com.diogonunes.jcolor.Attribute.*;

public class Hello {
  public static String format(String personName) {
      return colorize("(Java/SBT) ", WHITE_TEXT()) 
          + colorize ("Hello ", BLUE_TEXT())
          + colorize(personName, RED_TEXT()) 
          + colorize("!", BLUE_TEXT());
  }
}
