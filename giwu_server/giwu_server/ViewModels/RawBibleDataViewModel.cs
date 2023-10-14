using giwu_server.Models;

namespace giwu_server.ViewModels
{
    public class RawBibleDataViewModel
    {
        public List<BibleVerseKey> BibleVerseKey { set; get; }
        public List<CrossReference> CrossReference { set; get; }
        public List<KeyAbbreviationsEnglish> KeyAbbreviationsEnglish { set; get; }
        public List<KeyEnglish> KeyEnglish { set; get; }
        public List<KeyGenreEnglish> KeyGenreEnglish { set; get; }
        public List<Verses> Verses { set; get; }
    }
}
