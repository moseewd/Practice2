using System;
namespace ConsoleApplication8
{
    class Program
    {
        static void Main(string[] args)
        {
            int n;
            n = int.Parse(Console.ReadLine());
            bool[,] friends = new bool[n, n];
            for (int i = 0; i < n; i++)
            {
                string[] input = Console.ReadLine().Split(' ');
                for (int j = 0; j < n; j++)
                {
                    friends[i, j] = input[j] == "1";
                }
            }
            int bestcode = -1;
            int bestsize = 0;
 
            for (int groupcode = 1; groupcode < (1 << n); groupcode++)
            {
                int size = 0;
                for (int i = 0; i < n; i++)
                {
 
                    if (((groupcode >> i) & 1) != 0)
                    {
                        size++;
                    }
                }
 
                if (size > 5)
                {
                    continue;
                }
                if (size <= bestsize)
                {
                    continue;
                }
                bool good = true;
                for (int i = 0; i < n && good; i++)
                {
                    for (int j = 0; j < n && good; j++)
                    {
                        if (((groupcode >> i) & 1) != 0 && ((groupcode >> j) & 1) != 0 && !friends[i, j])
                        {
                            good = false;
                        }
                    }
                }
                if (good)
                {
                    bestcode = groupcode;
                    bestsize = size;
                }
 
            }
            Console.WriteLine(n - bestsize + 1);
            int color = 2;
            for (int i = 0; i < n; i++)
            {
                if (((bestcode >> i) & 1) != 0)
                {
                    Console.Write("1 ");
                }
                else
                {
                    Console.Write("{0} ", color);
                    color++;
                }
            }
        }
    }
}