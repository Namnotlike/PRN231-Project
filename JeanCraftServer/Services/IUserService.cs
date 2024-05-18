using JeanCraftServer.Controllers;
using JeanCraftLibrary.Dto;
using JeanCraftLibrary.Models;
using JeanCraftLibrary.Repositories;
using JeanCraftServer.Util;
using Microsoft.AspNetCore.Mvc;
using System.Drawing;

namespace JeanCraftServer.Services
{
    public interface IUserService
    {
        Task<Account?> GetUserByID(Guid userID);
        Task<Account?> GetUserByEmail(string email);
        Task<Account?> ChangePassword(ChangePWForm userDto);
        Task<Account> RegisterUser(string? fileName, Account user);
        Task<Account> CreateUserGoogle(GoogleLoginForm userDto);
        Task<Account?> UpdateUserProfile(Account user);
    }
}
