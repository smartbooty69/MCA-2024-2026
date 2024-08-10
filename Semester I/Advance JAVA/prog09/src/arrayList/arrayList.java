package arrayList;

import java.util.ArrayList;

public class arrayList {
    public static void main(String[] args) {
    	
        ArrayList<Integer> numbers = new ArrayList<>();

        numbers.add(10);
        numbers.add(20);
        numbers.add(30);
        numbers.add(60);
        numbers.add(12);
        System.out.println("After adding elements: " + numbers);

        numbers.add(1, 15); 
        numbers.add(4, 35);
        System.out.println("After inserting elements: " + numbers);

        numbers.remove(3); 
        numbers.remove(Integer.valueOf(50)); 
        System.out.println("After removing elements: " + numbers);

        System.out.println("Iterating through the ArrayList:");
        for (int number : numbers) {
            System.out.print(number + " ");
        }
        
        numbers.sort(null);
        System.out.println("\nIterating Sorted ArrayList:");
        for (int number : numbers) {
            System.out.print(number + " ");
        }
    }
}
