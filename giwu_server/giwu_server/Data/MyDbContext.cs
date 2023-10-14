using giwu_server.Models;
using Microsoft.EntityFrameworkCore;
using System;

namespace giwu_server.Data
{
    public class MyDbContext : DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
        {
            
        }
        public DbSet<Test> Tests { get; set; }

        public DbSet<BibleVerseKey> bible_version_key { get; set; }
        public DbSet<CrossReference> cross_reference { get; set; }
        public DbSet<KeyAbbreviationsEnglish> Key_abbreviations_english { get; set; }
        public DbSet<KeyEnglish> key_english { get; set; }
        public DbSet<KeyGenreEnglish> key_genre_english { get; set; }
        public DbSet<Verses> t_kjv { get; set; }
    }
}
