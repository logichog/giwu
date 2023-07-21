using giwu_server.Data;
using giwu_server.Models;

namespace giwu_server.Repository
{
    public class TestRepository
    {
        private MyDbContext _db;
        public TestRepository(MyDbContext db)
        {
            _db = db;
        }
        public List<Test> getAll()
        {
            return _db.Tests.ToList();
        }
    }
}
