using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Serialization
{
    public class CsvFilePersonSerializer : IFilePersonSerializer
    {
        public Person[] Deserializer(string filePath)
        {

            var allLines = File.ReadAllText(filePath);

            //var final = String.Join(" ", allLines);

            var obj = new CsvPersonSerializer();

            return obj.Deserialize(allLines);

        }

        public void Serializer(Person[] entities, string filePath)
        {
            var obj = new CsvPersonSerializer();

            var serialized = obj.Serialize(entities);

            //var final = serialized.Split(new string[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);

            File.WriteAllText(filePath, serialized);
        }
    }
}
