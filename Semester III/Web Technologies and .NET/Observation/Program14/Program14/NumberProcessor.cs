using System;
using System.Collections.Generic;

public static class NumberProcessor
{
    public static int GetSumOfDigits(int number)
    {
        int sum = 0;
        while (number != 0)
        {
            sum += number % 10;
            number /= 10;
        }
        return sum;
    }

    public static bool IsPalindrome(string input)
    {
        if (string.IsNullOrEmpty(input)) return false;
        int left = 0, right = input.Length - 1;
        while (left < right)
        {
            if (input[left] != input[right]) return false;
            left++;
            right--;
        }
        return true;
    }

    public static List<long> GenerateFibonacciSeries(int terms)
    {
        List<long> series = new List<long>();
        if (terms <= 0) return series;

        long first = 0, second = 1;
        series.Add(first);
        if (terms > 1) series.Add(second);

        for (int i = 2; i < terms; i++)
        {
            long next = first + second;
            series.Add(next);
            first = second;
            second = next;
        }

        return series;
    }
}