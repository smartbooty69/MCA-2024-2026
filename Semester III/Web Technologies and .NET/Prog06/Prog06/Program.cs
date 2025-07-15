using System;

class Program
{
    static void Main()
    {
        int R = int.Parse(Console.ReadLine()); 
        int[][] jaggedArray = new int[R][];

        for (int i = 0; i < R; i++)
        {
            int C = int.Parse(Console.ReadLine());
        

            jaggedArray[i] = new int[C];

            for (int j = 0; j < C; j++)
            {
                jaggedArray[i][j] = int.Parse(Console.ReadLine());
            }
        }

        foreach (int[] row in jaggedArray)
        {
            Console.WriteLine(string.Join(" ", row));
        }
    }
}
