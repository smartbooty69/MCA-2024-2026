class Course {
    private String courseName;
    private String courseId;
    private String courseCategory;

    public Course(String courseName, String courseId, String courseCategory) {
        this.courseName = courseName;
        this.courseId = courseId;
        this.courseCategory = courseCategory;
    }

    public String getCourseName() {
        return courseName;
    }

    public String getCourseId() {
        return courseId;
    }

    public String getCourseCategory() {
        return courseCategory;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public void setCourseCategory(String courseCategory) {
        this.courseCategory = courseCategory;
    }

    public void retrieveCourseFromDatabase(String courseName, String courseId, String courseCategory) {
        this.setCourseName(courseName);
        this.setCourseId(courseId);
        this.setCourseCategory(courseCategory);
    }

    public void printCourseDetails() {
        System.out.println("Course Name: " + getCourseName());
        System.out.println("Course ID: " + getCourseId());
        System.out.println("Course Category: " + getCourseCategory());
    }

    public void updateCourseName() {
        setCourseName("Computing in Java");
    }
}

public class Main {
    public static void main(String[] args) {
        Course course = new Course("Java Basics", "CS101", "Programming");
        course.retrieveCourseFromDatabase("Java Basics", "CS101", "Programming");
        course.printCourseDetails();
        course.updateCourseName();
        System.out.println("\nUpdated Course Details:");
        course.printCourseDetails();
    }
}
