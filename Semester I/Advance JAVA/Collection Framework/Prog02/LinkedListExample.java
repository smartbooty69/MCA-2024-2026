import java.util.LinkedList;

public class LinkedListExample {

    public static void main(String[] args) {
        
        LinkedList<String> linkedList = new LinkedList<>();
        
        linkedList.addFirst("Nevil");
        linkedList.addFirst("Anson");
        linkedList.addFirst("Vernon");
        
        linkedList.addLast("Joy");
        linkedList.addLast("Rome");
        linkedList.addLast("Frank");
        
        linkedList.add(3, "Om");
        
        System.out.println("LinkedList after Task A: " + linkedList);
        
        System.out.println("First Element: " + linkedList.getFirst());
        System.out.println("Last Element: " + linkedList.getLast());
        
        System.out.println("Element at Index 4: " + linkedList.get(4));
        
        linkedList.set(2, "Jody");
        
        System.out.println("LinkedList after Task B: " + linkedList);
        
        System.out.println("Length of LinkedList: " + linkedList.size());
        
        int indexOfFrank = linkedList.indexOf("Frank");
        System.out.println("Index of 'Frank': " + indexOfFrank);
  
        System.out.println("Iterating over LinkedList:");
        for (String element : linkedList) {
            System.out.println(element);
        }
        
        LinkedList<String> sublist = new LinkedList<>(linkedList.subList(1, 5));
        System.out.println("Sublist from index 1 to 4: " + sublist);
        
        LinkedList<String> queue = new LinkedList<>();
        queue.add("A");
        queue.add("B");
        queue.add("C");
        
        System.out.println("Queue: " + queue);
        
        System.out.println("Peek: " + queue.peek());
        
        System.out.println("Poll: " + queue.poll());
        System.out.println("Queue after poll: " + queue);
    }
}
