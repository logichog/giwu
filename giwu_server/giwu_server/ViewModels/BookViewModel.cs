namespace giwu_server.ViewModels
{
    public class BookViewModel
    {
        public int Id { set; get; }
        public string name { set; get; }
        public List<ChapterViewModel> Chapters { set; get; }
    }
}
