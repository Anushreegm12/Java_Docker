public class HelloWorld {
    public static void main(String[] args) {
        while(true) {
            System.out.println("Hello, World from Java in Docker!");
            try {
                Thread.sleep(5000);
            } catch(InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
