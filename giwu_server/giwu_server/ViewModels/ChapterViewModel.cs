namespace giwu_server.ViewModels
{
    public class ChapterViewModel
    {
        public string Id { set; get; }
        public int Chapter { set; get; }
        public List<VersesViewModel> Verses { set; get; }
    }
}
