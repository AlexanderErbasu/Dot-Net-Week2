using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//
//USING REGEX!!!!!!!!!!
//

namespace TextSearching
{
    public class FileTextSearcher : IFileTextSearcher
    {
        private ITextSearcher textSearcher;

        public FileTextSearcher(ITextSearcher textSearcher)
        {
            this.textSearcher = textSearcher;
        }

        public int Count(string filePath, string searchString)
        {
            var allText = File.ReadAllText(filePath);

            return textSearcher.Count(allText, searchString);
        }
    }
}
