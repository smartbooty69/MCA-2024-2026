import java.util.ArrayList;

public class ArrayListDemo {

    public static void main(String[] args) {
        
        ArrayList<Integer> numbers = new ArrayList<>();

        numbers.add(10);
        numbers.add(20);
        numbers.add(30);
        numbers.add(40);
        numbers.add(50);

        System.out.println("ArrayList before operations:");
        displayArrayList(numbers);

        numbers.add(2, 25);
        System.out.println("\nArrayList after adding 25 at index 2:");
        displayArrayList(numbers);

        numbers.remove(3);
        System.out.println("\nArrayList after removing element at index 3:");
        displayArrayList(numbers);

        numbers.set(0, 15);
        System.out.println("\nArrayList after updating element at index 0 to 15:");
        displayArrayList(numbers);

        int elementToFind = 40;
        boolean exists = numbers.contains(elementToFind);
        System.out.println("\nElement " + elementToFind + " exists in ArrayList: " + exists);

        int size = numbers.size();
        System.out.println("\nSize of ArrayList: " + size);

        numbers.clear();
        System.out.println("\nArrayList after clearing all elements:");
        displayArrayList(numbers);
    }
    
    private static void displayArrayList(ArrayList<Integer> list) {
        for (int num : list) {
            System.out.print(num + " ");
        }
        System.out.println();
    }
}
