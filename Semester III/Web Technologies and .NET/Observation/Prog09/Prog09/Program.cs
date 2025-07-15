using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Prog09
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number of subjects: ");
            string subInput = Console.ReadLine();
            int n;
            if (!int.TryParse(subInput, out n) || n <= 0)
            {
                Console.WriteLine("Invalid number of subjects.");
                return;
            }

            double total = 0;
            for (int i = 1; i <= n; i++)
            {
                Console.Write($"Enter marks for subject {i}: ");
                string markInput = Console.ReadLine();
                double marks;
                if (!double.TryParse(markInput, out marks) || marks < 0)
                {
                    Console.WriteLine("Invalid marks. Please enter a non-negative number.");
                    return;
                }
                total += marks;
            }

            double average = total / n;
            string grade;
            if (average >= 90)
                grade = "A";
            else if (average >= 80)
                grade = "B";
            else if (average >= 70)
                grade = "C";
            else if (average >= 60)
                grade = "D";
            else
                grade = "F";

            Console.WriteLine($"Average: {average:F2}");
            Console.WriteLine($"Grade: {grade}");
        }
    }
}
