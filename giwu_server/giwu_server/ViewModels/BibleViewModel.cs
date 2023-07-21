namespace giwu_server.ViewModels
{
    public class BibleViewModel
    {
        public string table { set; get; }
        public string abbreviation { set; get; }
        public string language { set; get; }
        public string version { set; get; }
        public string info_text { set; get; }
        public string info_url { set; get; }
        public string publisher { set; get; }
        public string copyright { set; get; }
        public string copyright_info { set; get; }
        public List<BookViewModel> Books { set; get; }

    }
}
