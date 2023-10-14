using giwu_server.Data;
using giwu_server.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

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
            return await _db.bible_version_key.Where(x => x.table == table).FirstOrDefaultAsync();
        }
        public async Task<List<KeyEnglish>> getBooks()
        {
            return await _db.key_english.ToListAsync();
        }
        public async Task<List<Verses>> getKJVVerses()
        {
            return await _db.t_kjv.ToListAsync();
        }
        public async Task<List<BibleVerseKey>> getBibleVerseKey(string table)
        {
            return await _db.bible_version_key.ToListAsync();
        }
        public async Task<List<CrossReference>> getCrossReference()
        {
            return await _db.cross_reference.ToListAsync();
        }
        public async Task<List<KeyAbbreviationsEnglish>> getKeyAbbreviationsEnglish()
        {
            return await _db.Key_abbreviations_english.ToListAsync();
        }
        public async Task<List<KeyEnglish>> getKeyEnglish()
        {
            return await _db.key_english.ToListAsync();
        }
        public async Task<List<KeyGenreEnglish>> getKeyGenreEnglish()
        {
            return await _db.key_genre_english.ToListAsync();
        }
        public async Task<List<Verses>?> getVerses(string table)
        {
            if (string.IsNullOrEmpty(table))
            {
                return null;
            }
            else if (table == "t_kjv")
            {
                return await _db.t_kjv.ToListAsync();
            }
            return null;
        }
    }
}
