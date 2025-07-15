using System;

namespace Prog12
{
    class JaggedArrayProgram
    {
        public static void Main(string[] args)
        {
            // --- Part 1: Input and Initialization ---

            Console.WriteLine("Enter number of rows:");
            int rows = int.Parse(Console.ReadLine());

            // 1. Declare a jagged array with a specified number of rows.
            int[][] jaggedArray = new int[rows][];

            // 2. Loop through each row to initialize its size and populate it with values.
            for (int i = 0; i < rows; i++)
            {
                Console.WriteLine($"Enter number of elements in row {i}:");
                int cols = int.Parse(Console.ReadLine());

                // Initialize the inner array (columns) for the current row.
                jaggedArray[i] = new int[cols];

                Console.WriteLine($"Enter {cols} integer values for row {i}:");
                for (int j = 0; j < jaggedArray[i].Length; j++)
                {
                    jaggedArray[i][j] = int.Parse(Console.ReadLine());
                }
            }

            // --- Part 2: Displaying the Array ---

            Console.WriteLine("\nJagged Array Elements:");

            // 3. Loop through each row to display its elements.
            for (int i = 0; i < jaggedArray.Length; i++)
            {
                // Loop through each element (column) in the current row.
                for (int j = 0; j < jaggedArray[i].Length; j++)
                {
                    // Use Write() to print elements on the same line, separated by a space.
                    Console.Write(jaggedArray[i][j] + " ");
                }
                // Use WriteLine() to move to the next line after a row is printed.
                Console.WriteLine();
            }
        }
    }
}
