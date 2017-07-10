using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App2_10july2017
{
    class Program
    {
        public static int CountWordsThatStartWith(string filePath,string searchString)
        {                      

            var textArray = File.ReadAllLines(filePath);

            return CountWordsThatStartWith(textArray, searchString);

        }

        //Refactoring: 

        public static int CountWordsThatStartWith(string[] textArray, string searchString)
        {
            int noOfElems = 0;

            foreach (var line in textArray)
            {
                string[] wordsLine = line.Split(' ');
                foreach (var wordElem in wordsLine)
                {
                    if (wordElem.StartsWith(searchString))
                        noOfElems++;
                }
            }

            return noOfElems;

        }
        static void Main(string[] args)
        {
            Console.WriteLine(CountWordsThatStartWith("myFile.txt","bla"));

            Console.ReadLine();
        }
    }
}