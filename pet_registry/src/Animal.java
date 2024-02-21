import java.util.HashMap;
import java.util.Map;

public class Animal {
    String name;
    String type;
    Map<String, String> commands = new HashMap<>();

    public Animal(String name, String type) {
        this.name = name;
        this.type = type;
    }

    public void addCommand(String command, String action) {
        commands.put(command, action);
    }

    public void listCommands() {
        for (String command : commands.keySet()) {
            System.out.println(command + " : " + commands.get(command));
        }
    }

    public void determineType() {
        System.out.println(name + " is a " + type);
    }
}
