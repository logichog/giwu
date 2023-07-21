using System.ComponentModel.DataAnnotations;

namespace giwu_server.Models
{
    public class Verses
    {
        [Key]
        public int id { set; get; }
        public int b { set; get; }
        public int c { set; get; }
        public int v { set; get; }
        public string t { set; get; }
    }
}
