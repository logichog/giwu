using AutoMapper;
using giwu_server.Models;
using giwu_server.Repository;
using giwu_server.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace giwu_server.Controllers
{
    public class BibleController : Controller
    {
        private readonly IMapper _mapper;
        private readonly BibleRepository _bibleRepository;

        public BibleController(IMapper mapper, BibleRepository bibleRepository)
        {
            _mapper = mapper;
            _bibleRepository = bibleRepository;
        }

        public IActionResult Index()
        {
            return Ok();
        }

        public async Task<IActionResult> GetKjv()
        {
            BibleViewModel model = _mapper.Map<BibleViewModel>(await _bibleRepository.getBookInfo("t_kjv"));

            // getting books and verses
            var booklist = await _bibleRepository.getBooks();
            var verselist = await _bibleRepository.getKJVVerses();

            // generate books
            List<BookViewModel> newBookList = new();

            foreach (var book in booklist)
            {
                List<ChapterViewModel> newChapterList = new();
                List<int> chapterIds = verselist.Where(x => x.b == book.b).Select(x => x.c).Distinct().ToList();
                foreach (var chapterId in chapterIds)
                {
                    newChapterList.Add(new()
                    {
                        Id = model.Table + "-" + book.t + "-" + book.b + "-" + chapterId,
                        Chapter = chapterId,
                        Verses = _mapper.Map<List<VersesViewModel>>(verselist.Where(x => x.b == book.b && x.c == chapterId).ToList()),
                    });
                }

                BookViewModel newBook = new()
                {
                    Id = book.b,
                    name = book.n,
                    ChapterCount = newChapterList.Count,
                    // Chapters = newChapterList,
                };

                newBookList.Add(newBook);
            }

            model.Books = newBookList;

            return Ok(model);
        }

        public async Task<IActionResult> GetRawData(string bibleName = "t_kjv")
        {
            RawBibleDataViewModel model = new();

            model.BibleVerseKey = await _bibleRepository.getBibleVerseKey(bibleName);
            model.CrossReference = await _bibleRepository.getCrossReference();
            model.KeyAbbreviationsEnglish = await _bibleRepository.getKeyAbbreviationsEnglish();
            model.KeyEnglish = await _bibleRepository.getKeyEnglish();
            model.KeyGenreEnglish = await _bibleRepository.getKeyGenreEnglish();
            model.Verses = await _bibleRepository.getVerses(bibleName);

            return Ok(model);
        }
    }
}
