using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Serialization
{
    public class CsvPersonSerializer : IPersonSerializer
    {
        public Person[] Deserialize(string text)
        {
            var persons = text.Split(new string[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
            //StringSplitOptions.RemoveEmptyEntries will remove the first line (which will be empty)

            List<Person> list = new List<Person>();

            foreach(var person in persons)
            {
                var personSplit = person.Split();

                Person newPerson = new Person { FirstName = personSplit[0], LastName = personSplit[1], Age = Int32.Parse(personSplit[2]) };

                list.Add(newPerson);
            }

            return (list.ToArray());
        }

        public string Serialize(Person[] entities)
        {
            string CSV="";
            foreach(var person in entities)
            {
                CSV += Environment.NewLine; //the first line will be empty
                CSV += person.FirstName + " " + person.LastName + " " + person.Age;
            }
            return CSV;
        }
    }
}
