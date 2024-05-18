using JeanCraftLibrary.Dto;
using JeanCraftLibrary.Models;
using JeanCraftServer.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JeanCraftServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserProfileController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserProfileController(IUserService userService)
        {
            _userService = userService;
        }

        // GET: api/Profile/{userId}
        [HttpGet("{userId}")]
        public async Task<IActionResult> GetProfile(Guid userId)
        {
            var account = await _userService.GetUserByID(userId);
            if (account == null)
            {
                return NotFound("User not found.");
            }
            return Ok(account);
        }

        // PUT: api/Profile/update
        [HttpPut("update")]
        public async Task<IActionResult> UpdateProfile([FromBody] Account account)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var updatedAccount = await _userService.UpdateUserProfile(account);
            if (updatedAccount == null)
            {
                return BadRequest("Unable to update user profile.");
            }
            return Ok(updatedAccount);
        }

        //// POST: api/Profile/change-password
        //[HttpPost("change-password")]
        //public async Task<IActionResult> ChangePassword([FromBody] ChangePWForm changePasswordDto)
        //{
        //    var result = await _userService.ChangePassword(changePasswordDto);
        //    if (result == null)
        //    {
        //        return BadRequest("Failed to change password. Check the old password.");
        //    }
        //    return Ok("Password changed successfully.");
        //}
    }
}
