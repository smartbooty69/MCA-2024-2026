using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Prog10
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Enter the number of elements in the array: ");
            string nInput = Console.ReadLine();
            int n;
            if (!int.TryParse(nInput, out n) || n <= 0)
            {
                Console.WriteLine("Invalid number of elements.");
                return;
            }

            double[] arr = new double[n];
            for (int i = 0; i < n; i++)
            {
                Console.Write($"Enter element {i + 1}: ");
                string elemInput = Console.ReadLine();
                double elem;
                if (!double.TryParse(elemInput, out elem))
                {
                    Console.WriteLine("Invalid input. Please enter a number.");
                    return;
                }
                arr[i] = elem;
            }

            double sum = arr.Sum();
            double average = sum / n;
            Console.WriteLine($"Sum: {sum}");
            Console.WriteLine($"Average: {average}");
        }
    }
}
