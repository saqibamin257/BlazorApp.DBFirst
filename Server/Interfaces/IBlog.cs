using BlazorApp.DBFirst.Shared.Models;

namespace BlazorApp.DBFirst.Server.Interfaces
{
    public interface IBlog
    {
        public List<Blog> GetBlogs();
        public void AddBlog(Blog blog);
        public void UpdateBlogDetails(Blog blog);
        public Blog GetBlogById(int id);
        public List<Blog> GetActiveBlogs(string constant);
        public void DeleteBlog(int id);

    }
}
