import java.util.Scanner;

public class Calendar {

    // Determine if a year is a leap year
    public static boolean isLeapYear(int year) {
        if (year % 4 == 0) {
            if (year % 100 == 0) {
                return year % 400 == 0;
            } else {
                return true;
            }
        }
        return false;
    }

    // Zeller's Congruence algorithm to find the day of the week for the 1st of a given month and year
    public static int getStartDay(int year, int month) {
        int q = 1;  // Day of the month
        int m = (month == 1 || month == 2) ? month + 12 : month;  // Convert Jan & Feb to 13 & 14 of the previous year
        int K = year % 100;
        int J = year / 100;
        
        if (month == 1 || month == 2) {
            year--;
        }
        
        int h = (q + (13 * (m + 1)) / 5 + K + (K / 4) + (J / 4) + 5 * J) % 7;
        
        // 0 = Saturday, 1 = Sunday, ..., 6 = Friday
        return ((h + 5) % 7) + 1;  // Adjusting so that 1 = Monday, ..., 7 = Sunday
    }

    // Get the number of days in a given month
    public static int getDaysInMonth(int year, int month) {
        switch (month) {
            case 1: return 31;
            case 2: return isLeapYear(year) ? 29 : 28;
            case 3: return 31;
            case 4: return 30;
            case 5: return 31;
            case 6: return 30;
            case 7: return 31;
            case 8: return 31;
            case 9: return 30;
            case 10: return 31;
            case 11: return 30;
            case 12: return 31;
            default: return 0;
        }
    }

    // Print the calendar for a given month and year
    public static void printCalendar(int year, int month) {
        String[] months = {
            "", // Padding for 1-based index
            "January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"
        };

        // Print the header
        System.out.println("  " + months[month] + " " + year);
        System.out.println("Mo Tu We Th Fr Sa Su");

        // Get the start day of the week and number of days in the month
        int startDay = getStartDay(year, month);
        int daysInMonth = getDaysInMonth(year, month);

        // Print leading spaces
        for (int i = 1; i < startDay; i++) {
            System.out.print("   ");
        }

        // Print the days of the month
        for (int day = 1; day <= daysInMonth; day++) {
            System.out.printf("%2d ", day);

            // Move to the next line after printing Sunday
            if ((day + startDay - 1) % 7 == 0) {
                System.out.println();
            }
        }
        System.out.println();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter year: ");
        int year = scanner.nextInt();

        System.out.print("Enter month (1-12): ");
        int month = scanner.nextInt();

        printCalendar(year, month);
    }
}