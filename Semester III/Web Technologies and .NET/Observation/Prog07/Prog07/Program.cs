using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Prog07
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter a year: ");
            string input = Console.ReadLine();
            int year;
            if (int.TryParse(input, out year) && year > 0)
            {
                if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
                {
                    Console.WriteLine($"{year} is a leap year.");
                }
                else
                {
                    Console.WriteLine($"{year} is not a leap year.");
                }
            }
            else
            {
                Console.WriteLine("Invalid input. Please enter a valid positive year.");
            }
        }
    }
}
