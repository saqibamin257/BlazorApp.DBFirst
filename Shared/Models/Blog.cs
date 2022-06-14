using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace BlazorApp.DBFirst.Shared.Models
{
    public class Blog
    {

        public int Blogid { get; set; }
        [Required]
        public string Title { get; set; }        
        public DateTime CreationDate { get; set; }
        [Required]
        public string PostBody { get; set; } 
        public DateTime PublishedDate { get; set; }
        public bool Status { get; set; }
        public bool IsDeleted { get; set; }
    }
}
