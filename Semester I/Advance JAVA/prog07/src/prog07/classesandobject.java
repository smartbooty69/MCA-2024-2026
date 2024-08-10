package prog07;

class MyDetails {
	String id;
	String name;
	void insertRecord(String rno, String n) {
			id=rno;
			name=n;
	}
	void displayRecord() {
		System.out.println(id);
		System.out.println(name);
		System.out.println('\n');

	}
}


public class classesandobject {
 public static void main(String[] args) {
	 MyDetails s1=new MyDetails();
	 s1.insertRecord("243MCA59", "Clancy");	
	 s1.displayRecord();
	 MyDetails s2=new MyDetails();
	 s2.insertRecord("243MCA03", "Vernon");	
	 s2.displayRecord();
 }
}