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
        public bool IsAuthenticUser(UserInformation userInfo) 
        {
            try
            {
                var user = from u in _dbContext.UserInformations
                           where u.UserName == userInfo.UserName && u.Password == userInfo.Password
                           select u;
                           

                if (user.Any()) 
                {
                    return true;
                }                    
            }
            catch
            {
                throw;
            }
            return false;
        }

    }
}
