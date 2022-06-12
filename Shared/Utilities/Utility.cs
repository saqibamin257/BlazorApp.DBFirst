using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlazorApp.DBFirst.Shared.Utilities
{
    public class Utility
    {
        public static string TruncateString(string text, int maxChars) =>                    
             text.Length <= maxChars ? text : $"{text.Substring(0, maxChars)}...";        
    }
}
