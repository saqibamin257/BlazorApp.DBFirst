using BlazorApp.DBFirst.Server.Interfaces;
using BlazorApp.DBFirst.Server.Models;
using BlazorApp.DBFirst.Shared.Models;
using Microsoft.EntityFrameworkCore;

namespace BlazorApp.DBFirst.Server.Services
{
    public class BlogManager: IBlog
    {
        readonly DatabaseContext _dbContext = new();
        public BlogManager(DatabaseContext dbContext)
        {
            _dbContext = dbContext;
        }
        //Get All Blogs Data
        public List<Blog> GetBlogs() 
        {
            try 
            {
                var blog = from b in _dbContext.Blogs
                          where b.IsDeleted == false
                          select b;

                return blog.ToList();
            }
            catch 
            {
                throw;
            }
        }

        //Get Active Blogs
        public List<Blog> GetActiveBlogs(string constant)
        {
            try
            {
                if (constant == "active")
                {
                    var blog = from b in _dbContext.Blogs
                               where b.IsDeleted == false && b.Status == true
                               select b;

                    return blog.ToList();
                }
                else
                {
                    throw new ArgumentException();
                }
            }
            catch
            {
                throw;
            }
        }

        //Add new blog
        public void AddBlog(Blog blog) 
        {
            try 
            {
                _dbContext.Blogs.Add(blog);
                _dbContext.SaveChanges();
            }
            catch { throw; }            
        }
        //Update blog
        public void UpdateBlogDetails(Blog blog) 
        {
            try 
            {
                _dbContext.Entry(blog).State = EntityState.Modified;
                _dbContext.SaveChanges();
            }
            catch 
            {
                throw;
            }
        }
        //get specific blog by id
        public Blog GetBlogById(int id) 
        {
            try
            {
                Blog? blogData = _dbContext.Blogs.Find(id);
                if(blogData != null) 
                {
                    return blogData;
                }
                else 
                {
                    throw new ArgumentNullException();
                }
            }
            catch 
            {
                throw;
            }
        }
        //delete blog
        public void DeleteBlog(int id) 
        {
            try 
            {
                Blog? blog = _dbContext.Blogs.Find(id);
                if (blog != null) 
                {
                    blog.IsDeleted = true;                    
                    _dbContext.SaveChanges();
                }
                else 
                {
                    throw new ArgumentNullException();
                }
            }
            catch 
            { throw; }
            
        }
    }
}
