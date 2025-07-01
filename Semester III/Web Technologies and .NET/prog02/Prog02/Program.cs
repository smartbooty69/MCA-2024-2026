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
            Console.WriteLine("Insert N:");
            int n = Console.Read();

            if (n % 2 == 0)
            {
                Console.WriteLine("n is even");
            }
            else
            {
                Console.WriteLine("n is odd");
            }
        }
    }
}
