using Microsoft.AspNetCore.Mvc;

namespace giwu_server.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return Ok();
        }
    }
}
