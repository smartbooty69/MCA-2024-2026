package clancy;

class Course {
    private String courseName;
    private String courseID;
    private String courseCategory;

    public Course(String courseName, String courseID, String courseCategory) {
        this.courseName = courseName;
        this.courseID = courseID;
        this.courseCategory = courseCategory;
    }

    public String getCourseName() {
        return courseName;
    }

    public String getCourseID() {
        return courseID;
    }

    public String getCourseCategory() {
        return courseCategory;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public void setCourseCategory(String courseCategory) {
        this.courseCategory = courseCategory;
    }

    public void printCourseDetails() {
        System.out.println("Course Name: " + courseName);
        System.out.println("Course ID: " + courseID);
        System.out.println("Course Category: " + courseCategory);
    }
}

public class CourseApp {
    public static Course retrieveCourseFromDatabase() {
        return new Course("Introduction to Java", "CS101", "Programming");
    }

    public static void main(String[] args) {
        Course c = retrieveCourseFromDatabase();
        System.out.println("Initial Course Details:");
        c.printCourseDetails();

        c.setCourseName("Computing in Java");
        System.out.println("Updated Course Details:");
        c.printCourseDetails();
    }
}
