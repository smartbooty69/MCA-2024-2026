using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Prog03
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter two numbers to compare:");
            int num1 = Console.Read();
            int num2 = Console.Read();
            Console.WriteLine("Select an operation: +, -, *, /");
            char operation = Console.ReadKey().KeyChar;

            while (true)
            {
                switch (operation)
                {
                    case '+':
                        Console.WriteLine($"The sum of {num1} and {num2} is {num1 + num2}");
                        break;
                    case '-':
                        Console.WriteLine($"The difference between {num1} and {num2} is {num1 - num2}");
                        break;
                    case '*':
                        Console.WriteLine($"The product of {num1} and {num2} is {num1 * num2}");
                        break;
                    case '/':
                        if (num2 != 0)
                            Console.WriteLine($"The quotient of {num1} and {num2} is {num1 / num2}");
                        else
                            Console.WriteLine("Cannot divide by zero.");
                        break;
                    default:
                        Console.WriteLine("Invalid operation selected.");
                        break;

                }
            }
        }
            
    }
}
