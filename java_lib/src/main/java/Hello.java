public class Hello {
  public static void main(String[] args) {
    if (args.length == 0) {
      System.out.println("The \"person name\" path parameter should be provided.");
      System.exit(1);
    } else {
      String personName = args[0];
      System.out.println("(Java) Hello " + personName + "!"); 
    }
  }
}
