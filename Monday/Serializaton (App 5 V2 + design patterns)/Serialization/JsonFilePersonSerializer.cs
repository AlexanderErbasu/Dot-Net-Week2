using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace Serialization
{
    public class JsonFilePersonSerializer : IFilePersonSerializer
    {
        public Person[] Deserializer(string filePath)
        {
            var serializer = new JavaScriptSerializer();

            var allText = File.ReadAllText(filePath);

            var allPersons = serializer.Deserialize<Person[]>(allText);

            return allPersons;
        }

        public void Serializer(Person[] entities, string filePath)
        {
            var serializer = new JavaScriptSerializer();

            var allText = serializer.Serialize(entities);

            File.WriteAllText(filePath, allText);
        }
    }
}
