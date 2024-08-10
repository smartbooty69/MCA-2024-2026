package prog08;

import java.util.ArrayList;

public class arraylist {
	public static void main(String[] args) {
        ArrayList<String> students = new ArrayList<>();

        students.add("Clancy");
        students.add("Vernon");
        students.add("Nevil");
        students.add("Glen");
        
        System.out.println(students.get(1));
        System.out.println(students.isEmpty());

        students.set(1, "Anson");
        students.remove(2);
    
        for( String student: students) {
            System.out.println(student);
        }
    }
}