using System;

namespace Prog11
{
    class StudentInput
    {
        // The Main method is the entry point of a C# application.
        static void Main(string[] args)
        {
            Console.WriteLine("Enter your name");
            string name = Console.ReadLine();

            Console.WriteLine("Enter your age");
            // Console.ReadLine() returns a string, so it must be converted to an integer.
            int age = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter your Reg Number");
            // This also needs to be converted to an integer.
            int regno = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter your favorite language");
            string fav = Console.ReadLine();

            // Create an instance of the StudentInfo class.
            StudentInfo studen = new StudentInfo();
            
            // Call the DisplayInfo method and pass the collected data.
            studen.DisplayInfo(name, age, regno, fav);
        }
    }

    class StudentInfo
    {
        // This method displays the student's details.
        // It's set to 'public' to be accessible from the StudentInput class.
        public void DisplayInfo(string name, int age, int regno, string fav)
        {
            Console.WriteLine("Student name is " + name);
            Console.WriteLine("Student Regno is " + regno);
            // C# is case-sensitive; the parameter is 'age'.
            Console.WriteLine("Student Age is " + age);
            Console.WriteLine("Student Fav program is " + fav);
        }
    }
}
