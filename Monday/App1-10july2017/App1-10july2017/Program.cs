using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//
//Streams:
//
namespace App1_10july2017
{
    class Program
    {
        static void Main(string[] args)
        {
        
        //File.WriteAllText(@"myFirstWrittenFile.txt", @"Ana a mancat multe mere peste weekend.");
        //same as the using used below:

        using (var streamWriter = new FileStream(@"myFirstWrittenFile.txt", FileMode.Create))
            {
                using(var stringWriter = new StreamWriter(streamWriter))
                {
                    stringWriter.Write("Ana a mancat multe mere peste weekend. Mai multe decat Irina.");
                }
            }

            //var text = File.ReadAllText(@"myFirstWrittenFile.txt");
            //same as the using used below:

            string text = null;

            using (var streamReader = new FileStream(@"myFirstWrittenFile.txt", FileMode.Open)){
                using(var stringReader = new StreamReader(streamReader))
                {
                    text = stringReader.ReadToEnd();
                }
            }

            Console.WriteLine(text);

            Console.ReadLine();

        }
    }
}
