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

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            Blog blog = _IBlog.GetBlogById(id);
            if (blog != null)
            {
                return Ok(blog);
            }
            return NotFound();
        }

        [Route("[action]/{constant}")]       
        [HttpGet]
        public async Task<List<Blog>> GetActiveBlogs(string constant)
        {          
          return await Task.FromResult(_IBlog.GetActiveBlogs(constant));                   
        }
        [HttpPost]
        public void Post(Blog blog)
        {
            _IBlog.AddBlog(blog);
        }
        [HttpPut]
        public void Put(Blog blog)
        {
            _IBlog.UpdateBlogDetails(blog);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _IBlog.DeleteBlog(id);
            return Ok();
        }
    }
}
