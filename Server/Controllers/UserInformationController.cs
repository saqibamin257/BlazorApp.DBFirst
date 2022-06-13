using BlazorApp.DBFirst.Server.Interfaces;
using BlazorApp.DBFirst.Shared.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BlazorApp.DBFirst.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserInformationController : ControllerBase
    {
        private readonly IUserInformation IUserInformation;
        public UserInformationController(IUserInformation iUserInformation)
        {
            IUserInformation = iUserInformation;
        }
        
        [HttpGet]
        public  bool IsAuthenticUser(string userid, string password) 
        {
           return IUserInformation.IsAuthenticUser(userid, password);
        }
    }
}
