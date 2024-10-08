package com.mca_demo;

public class MVCPatternDemo {

	public static void main(String[] args) {
        Course model  = retriveCourseFromDatabase();

        CourseView view = new CourseView();
 
        CourseController controller = new CourseController(model, view);
        controller.updateView();

        controller.setCourseName("Python");
        System.out.println("\nAfter updating, Course Details are as follows");

        controller.updateView();
     }

     private static Course retriveCourseFromDatabase(){
        Course course = new Course();
        course.setName("Java");
        course.setId("01");
        course.setCategory("Programming");
        return course;
     }
	}

