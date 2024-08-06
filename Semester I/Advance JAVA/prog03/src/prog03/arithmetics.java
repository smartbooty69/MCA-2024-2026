package prog03;

import java.util.Scanner;

public class arithmetics {

	public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

		
		 System.out.print("Enter the first number: ");
	        double num1 = sc.nextInt();
	        
	        System.out.print("Enter the second number: ");
	        double num2 = sc.nextInt();

	        double addition = num1 + num2;
	        double subtraction = num1 - num2;
	        double multiplication = num1 * num2;
	        double division = num1 /num2;
	            
	        System.out.println("Addition: " + addition);
	        System.out.println("Subtraction: " + subtraction);
	        System.out.println("Multiplication: " + multiplication);
	        System.out.println("Division: " + division);
	       
	        sc.close();
		
	}

}
