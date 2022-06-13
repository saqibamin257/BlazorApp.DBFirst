using BlazorApp.DBFirst.Server.Interfaces;
using BlazorApp.DBFirst.Server.Models;
using BlazorApp.DBFirst.Shared.Models;
using Microsoft.EntityFrameworkCore;

namespace BlazorApp.DBFirst.Server.Services
{
    public class UserInformationManager :IUserInformation
    {
        readonly DatabaseContext _dbContext = new();
        public UserInformationManager(DatabaseContext dbContext)
        {
            _dbContext = dbContext;
        }
        public bool IsAuthenticUser(string userName, string password) 
        {
            try
            {
                var userInfo = from user in _dbContext.UserInformations
                               where user.UserName == userName && user.Password == password
                               select user;
                if (userInfo != null)
                    return true;
            }
            catch
            {
                throw;
            }
            return false;
        }
    }
}
