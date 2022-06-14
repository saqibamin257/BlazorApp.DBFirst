using BlazorApp.DBFirst.Shared.Models;

namespace BlazorApp.DBFirst.Server.Interfaces
{
    public interface IUserInformation
    {
       public bool IsAuthenticUser(UserInformation userInfo);
    }
}
