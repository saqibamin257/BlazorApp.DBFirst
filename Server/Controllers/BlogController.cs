using BlazorApp.DBFirst.Server.Interfaces;
using BlazorApp.DBFirst.Shared.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BlazorApp.DBFirst.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlogController : ControllerBase
    {
        private readonly IBlog _IBlog;
        public BlogController(IBlog iBlog)
        {
            _IBlog = iBlog;
        }
        [HttpGet]
        public async Task<List<Blog>> Get() 
        {
            return await Task.FromResult(_IBlog.GetBlogs());
        }
    }
}
