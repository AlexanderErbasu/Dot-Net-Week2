using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Serialization
{
    public interface IFilePersonSerializer
    {
        void Serializer(Person[] entities, string filePath);
        Person[] Deserializer(string filePath);
    }
}
