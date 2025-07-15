using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Prog06
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter a string: ");
            string input = Console.ReadLine();
            if (input == null)
            {
                Console.WriteLine("Invalid input.");
                return;
            }
            string processed = new string(input.Where(char.IsLetterOrDigit).ToArray()).ToLower();
            string reversed = new string(processed.Reverse().ToArray());
            if (processed == reversed)
            {
                Console.WriteLine($"'{input}' is a palindrome.");
            }
            else
            {
                Console.WriteLine($"'{input}' is not a palindrome.");
            }
        }
    }
}
