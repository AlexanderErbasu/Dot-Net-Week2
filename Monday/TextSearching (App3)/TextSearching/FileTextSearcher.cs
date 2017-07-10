using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TextSearching
{
    public class FileTextSearcher : IFileTextSearcher
    {
        public int Count(string filePath, string searchString)
        {
            var textArray = File.ReadAllText(filePath);

                                 
            return new TextSearcher().Count(textArray, searchString);
        }
    }
}
