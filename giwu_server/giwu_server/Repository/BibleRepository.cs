using giwu_server.Data;
using giwu_server.Models;
using Microsoft.EntityFrameworkCore;

namespace giwu_server.Repository
{
    public class BibleRepository
    {
        private MyDbContext _db;
        public BibleRepository(MyDbContext db)
        {
            _db = db;
        }
        public async Task<BibleVerseKey> getBookInfo(string table)
        {
            return await _db.bible_verse_vey.Where(x => x.table == table).FirstOrDefaultAsync();
        }
        public async Task<List<KeyEnglish>> getBooks()
        {
            return await _db.key_english.ToListAsync();
        }
        public async Task<List<Verses>> getKJVVerses()
        {
            return await _db.t_kjv.ToListAsync();
        }
    }
}
