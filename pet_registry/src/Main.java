public class Main {
    public static void main(String[] args) {
        try (Counter counter = new Counter()) {
            Dog dog = new Dog("Rex");
            dog.addCommand("sit", "Sits down");
            dog.addCommand("fetch", "Brings the ball back");

            dog.determineType();
            dog.listCommands();

            counter.add();
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        }
    }
}