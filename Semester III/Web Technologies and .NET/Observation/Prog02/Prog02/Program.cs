using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Prog02
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter first number: ");
            string input1 = Console.ReadLine();
            double num1;
            if (!double.TryParse(input1, out num1))
            {
                Console.WriteLine("Invalid input for first number.");
                return;
            }

            Console.Write("Enter operator (+, -, *, /): ");
            string op = Console.ReadLine();

            Console.Write("Enter second number: ");
            string input2 = Console.ReadLine();
            double num2;
            if (!double.TryParse(input2, out num2))
            {
                Console.WriteLine("Invalid input for second number.");
                return;
            }

            double result = 0;
            bool validOp = true;
            switch (op)
            {
                case "+":
                    result = num1 + num2;
                    break;
                case "-":
                    result = num1 - num2;
                    break;
                case "*":
                    result = num1 * num2;
                    break;
                case "/":
                    if (num2 == 0)
                    {
                        Console.WriteLine("Error: Division by zero.");
                        return;
                    }
                    result = num1 / num2;
                    break;
                default:
                    validOp = false;
                    Console.WriteLine("Invalid operator.");
                    break;
            }

            if (validOp)
            {
                Console.WriteLine($"Result: {num1} {op} {num2} = {result}");
            }
        }
    }
}
