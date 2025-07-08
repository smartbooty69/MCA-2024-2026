using System;


namespace Prog07
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[] arr = { 12, 42, 31, 40, 25, 8, 19, 55, 3, 27 };

            Console.WriteLine("Array Length: " + arr.Length);

            Array.Sort(arr);
            Console.WriteLine("Sorted Array: " + string.Join(", ", arr));

            Array.Reverse(arr);
            Console.WriteLine("Reversed Array: " + string.Join(", ", arr));

            int index = Array.IndexOf(arr, 31);
            Console.WriteLine("Index of 31: " + index);

            Array.Clear(arr, 0, 2); 
            Console.WriteLine("Array after Clear: " + string.Join(", ", arr));

            Console.ReadLine();
        }
    }
}
