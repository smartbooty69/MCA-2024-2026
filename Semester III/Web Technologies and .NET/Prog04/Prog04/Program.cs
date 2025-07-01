using System;

class GfG
{
    static bool isPrime(int n)
    {
        if (n <= 1)
            return false;

        for (int i = 2; i < n; i++)
            if (n % i == 0)
                return false;

        return true;
    }

    static void Main(string[] args)
    {
        Console.WriteLine("Enter a number:");
        int n = Console.Read();
        if (isPrime(n))
            Console.WriteLine("true");
        else
            Console.WriteLine("false");
    }
}