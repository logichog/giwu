using System.ComponentModel.DataAnnotations;

namespace giwu_server.Models
{
    public class CrossReference
    {
        [Key]
        public int vid { set; get; }
        public int r { set; get; }
        public int sv { set; get; }
        public int ev { set; get; }
    }
}
