using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Prog08
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number of terms for Fibonacci series: ");
            string input = Console.ReadLine();
            int n;
            if (int.TryParse(input, out n) && n > 0)
            {
                Console.WriteLine($"Fibonacci series up to {n} terms:");
                int a = 0, b = 1;
                for (int i = 1; i <= n; i++)
                {
                    Console.Write(a + (i < n ? ", " : "\n"));
                    int next = a + b;
                    a = b;
                    b = next;
                }
            }
            else
            {
                Console.WriteLine("Invalid input. Please enter a positive integer.");
            }
        }
    }
}
