using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace App4_10july2017
{
    class Program
    {
        static void Main(string[] args)
        {
            var person1 = new Person { FirstName = "A", LastName = "B", Age = 12 };
            var person2 = new Person { FirstName = "C", LastName = "D", Age = 22 };

            ////////// CSV
            Serialize(new Person[] { person1, person2 }, "person1.txt");

            var allPersons = Deserialize("person1.txt");

            foreach(var person in allPersons)
            {
                Console.WriteLine(
                    string.Format(
                        @"FirstName={0}, LastName={1}, Age={2}",
                        person.FirstName,
                        person.LastName,
                        person.Age));
            }

            ///////// JSON
            SerializeJson(new Person[] { person1, person2 }, "personJson.txt");

            var allPersonsJson = DeserializeJson("personJson.txt");

            foreach (var person in allPersonsJson)
            {
                Console.WriteLine(
                    string.Format(
                        @"FirstName={0}, LastName={1}, Age={2}",
                        person.FirstName,
                        person.LastName,
                        person.Age));
            }

            Console.ReadLine();
        }

        public static Person[] Deserialize(string filePath)
        {
            var allLines = File.ReadAllLines(filePath);
            var allPersons = new List<Person>();

            foreach(var line in allLines)
            {
                var items = line.Split(',');
                int age = 0;

                if (!int.TryParse(items[2], out age))
                {
                    continue;
                }

                var person = new Person
                {
                    FirstName = items[0],
                    LastName = items[1],
                    Age = age
                };

                allPersons.Add(person);
            }

            return allPersons.ToArray();
        }

        public static void Serialize(Person[] persons, String filePath)
        {
            var allLines = new List<string>();

            foreach (var person in persons)
            {
                var line = string.Format(@"{0},{1},{2}"
                        , person.FirstName
                        , person.LastName
                        , person.Age);

                Console.WriteLine(line);

                allLines.Add(line);
            }

            File.WriteAllLines(filePath, allLines);
        }

        public static Person[] DeserializeJson(string filePath)
        {
            var serializer = new JavaScriptSerializer();

            var allText = File.ReadAllText(filePath);

            var allPersons = serializer.Deserialize<Person[]>(allText);

            return allPersons;
        }
        public static void SerializeJson(Person[] persons, String filePath)
        {
            var serializer = new JavaScriptSerializer();

            var allText = serializer.Serialize(persons);

            File.WriteAllText(filePath, allText);
        }
    }
}
