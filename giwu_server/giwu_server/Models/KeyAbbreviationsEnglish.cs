using System.ComponentModel.DataAnnotations;

namespace giwu_server.Models
{
    public class KeyAbbreviationsEnglish
    {
        [Key]
        public int id { set; get; }
        public string a { set; get; }
        public int b { set; get; }
        public bool p { set; get; }
    }
}
