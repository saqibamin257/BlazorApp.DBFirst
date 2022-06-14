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
        private readonly IUserInformation _IUserInformation;
        public UserInformationController(IUserInformation iUserInformation)
        {
            _IUserInformation = iUserInformation;
        }
        
        [HttpPost]
        public IActionResult IsAuthenticUser(UserInformation userInfo) 
        {
            var result = _IUserInformation.IsAuthenticUser(userInfo);
            if (result) 
            {
                return Ok();
            }
            else { return NotFound(); }
        }
    }
}
