using System.ComponentModel.DataAnnotations;

namespace giwu_server.Models
{
    public class Test
    {
        [Key]
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    }
}
