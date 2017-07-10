using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TextSearching
{
    public class TextSearcher : ITextSearcher
    {
        public int Count(string text, string searchString)
        {
            var allWords = text.Split(' ');

            int count = 0;

            foreach(var word in allWords)
            {
                if (word.Contains(searchString))
                    count++;
            }

            return count;
        }
    }
}
