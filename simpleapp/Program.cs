﻿using System;
using System.Linq;

namespace simpleapp
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            const string defaultMessage = "Please provide valid numbers for addition !!!";

            if (args == null || !args.Any())
            {
                Console.WriteLine(defaultMessage);
            }
            else
            {
                var sum = args.Sum(Convert.ToInt32);
                Console.WriteLine("Total Sum = " + sum);
            }

            Console.Read();
        }
    }
}
