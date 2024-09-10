package hashSet;

import java.util.HashSet;
import java.util.Iterator;

public class HashSetExample {

    public static void main(String[] args) {
        HashSet<Integer> studentIds = new HashSet<>();
        studentIds.add(101);
        studentIds.add(102);
        studentIds.add(103);
        
        studentIds.add(103);
        studentIds.add(104);
        
        System.out.println("Student IDs after addition: " + studentIds);
        
        System.out.println("Is set empty? " + studentIds.isEmpty());
        System.out.println("Size of set: " + studentIds.size());
        
        System.out.println("Does the set contain ID 105? " + studentIds.contains(105));
        
        studentIds.remove(102);
        System.out.println("Student IDs after removing 102: " + studentIds);
        
        studentIds.remove(200);
        
        System.out.println("Iterating over student IDs:");
        Iterator<Integer> iterator = studentIds.iterator();
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
        
        Integer[] idsArray = studentIds.toArray(new Integer[0]);
        System.out.println("Student IDs as Array: ");
        for (Integer id : idsArray) {
            System.out.println(id);
        }
        
        HashSet<Integer> additionalIds = new HashSet<>();
        additionalIds.add(106);
        additionalIds.add(107);
        additionalIds.add(108);
        
        studentIds.addAll(additionalIds);
        System.out.println("Student IDs after union: " + studentIds);
        
        HashSet<Integer> commonIds = new HashSet<>();
        commonIds.add(103);
        commonIds.add(107);
        commonIds.add(109);
        
        studentIds.retainAll(commonIds);
        System.out.println("Student IDs after intersection: " + studentIds);
        
        HashSet<Integer> diffIds = new HashSet<>();
        diffIds.add(101);
        diffIds.add(107);
        
        studentIds.removeAll(diffIds);
        System.out.println("Student IDs after difference: " + studentIds);
        
        studentIds.clear();
        System.out.println("Student IDs after clear: " + studentIds);
    }
}
