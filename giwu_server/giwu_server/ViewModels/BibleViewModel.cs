namespace giwu_server.ViewModels
{
    public class BibleViewModel
    {
        public string Table { set; get; }
        public string Abbreviation { set; get; }
        public string Language { set; get; }
        public string Version { set; get; }
        public string InfoText { set; get; }
        public string InfoUrl { set; get; }
        public string Publisher { set; get; }
        public string Copyright { set; get; }
        public string CopyrightInfo { set; get; }
        public List<BookViewModel> Books { set; get; }

    }
}
