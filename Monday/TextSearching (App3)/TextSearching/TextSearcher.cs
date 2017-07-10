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
            int noOfElems = 0;
            
                string[] wordsLine = text.Split(' ');

                foreach (var wordElem in wordsLine)
                {
                    if (wordElem.Contains(searchString))
                        noOfElems++;
                }
            

            return noOfElems;
        }
    }
}
