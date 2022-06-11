using BlazorApp.DBFirst.Server.Interfaces;
using BlazorApp.DBFirst.Server.Models;
using BlazorApp.DBFirst.Shared.Models;
using Microsoft.EntityFrameworkCore;

namespace BlazorApp.DBFirst.Server.Services
{
    public class UserManager : IUser
    {
        readonly DatabaseContext _dbContext = new();
        public UserManager(DatabaseContext dbContext)
        {
            _dbContext = dbContext;
        }
        //To Get All user Details
        public List<User> GetUserDetails() 
        {
            try
            {
                return _dbContext.Users.ToList();
            }
            catch
            {
                throw;
            }
        }
        //To Add New User
        public void AddUser(User user) 
        {
            try 
            {
                _dbContext.Users.Add(user);
                _dbContext.SaveChanges();
            }
            catch 
            {
             throw;
            }           
        }
        //Update User
        public void UpdateUserDetails(User user) 
        {
            try 
            {
                _dbContext.Entry(user).State = EntityState.Modified;
                _dbContext.SaveChanges();
            } 
            catch { throw; }
        }

        //GetUserData of speciifc user
        public User GetUserData(int id) 
        {
            try
            {
                User? user = _dbContext.Users.Find(id);
                if (user != null) 
                {
                    return user;
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
        //Delete User
        public void DeleteUser(int id) 
        {
            try 
            {
                User? user = _dbContext.Users.Find(id);
                if (user != null) 
                {
                    _dbContext.Users.Remove(user);
                    _dbContext.SaveChanges();
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

    }
}
