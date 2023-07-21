using giwu_server.Repository;
using Microsoft.AspNetCore.Mvc;

namespace giwu_server.Controllers
{
    public class TestController : Controller
    {
        private readonly TestRepository _testRepository;
        public TestController(TestRepository testRepository)
        { 
            _testRepository = testRepository;
        }
        public IActionResult Index()
        {
            return Ok();
        }
    }
}
