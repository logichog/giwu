using AutoMapper;
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

        public async Task<IActionResult> GetKjv(string bibleName)
        {
            BibleViewModel model = _mapper.Map<BibleViewModel>(await _bibleRepository.getBookInfo(bibleName));

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
                        Id = model.table + "-" + book.t + "-" + book.b + "-" + chapterId,
                        Chapter = chapterId,
                        Verses = _mapper.Map<List<VersesViewModel>>(verselist.Where(x => x.b == book.b && x.c == chapterId).ToList()),
                    });
                }

                BookViewModel newBook = new()
                {
                    Id = book.b,
                    name = book.n,
                    Chapters = newChapterList
                };

                newBookList.Add(newBook);
            }

            model.Books = newBookList;

            return Ok(model);
        }
    }
}
