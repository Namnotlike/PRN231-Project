
using JeanCraftLibrary.Dto;
using JeanCraftLibrary.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Writers;
using Microsoft.VisualBasic;
using System;
using System.Data.Common;
using System.Drawing;
using static Microsoft.Extensions.Logging.EventSource.LoggingEventSource;

namespace JeanCraftLibrary.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly JeanCraftContext _context;

        public UserRepository(JeanCraftContext context)
        {
            _context = context;
        }

        public async Task<Account?> ChangePassword(Account user, string newPassword)
        {
            user.Password = newPassword;
            //userOld.LastUpdateDate = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return user;
        }

        public async Task<Account> CreateUserGoogle(Account user)
        {
            await _context.Accounts.AddAsync(user);
            await _context.SaveChangesAsync();
            return user;
        }

        public async Task<Account?> GetUserByEmail(string email)
        {
            return await _context.Accounts.FirstOrDefaultAsync(u => u.Email == email);
        }

        public async Task<Account?> GetUserByID(Guid userID)
        {
            return await _context.Accounts.FirstOrDefaultAsync(u => u.UserId == userID);
        }

        public async Task<Account> RegisterUser(string? fileName, Account user)
        {
            try
            {
                await _context.Accounts.AddAsync(user);
                await _context.SaveChangesAsync();
                return user;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public async Task<Account?> UpdateUser(Account user)
        {
            var userToUpdate = await _context.Accounts.FirstOrDefaultAsync(u => u.UserId == user.UserId);
            if (userToUpdate != null)
            {
                userToUpdate.UserName = user.UserName;
                userToUpdate.Email = user.Email;
                userToUpdate.Image = user.Image;
                userToUpdate.Password = user.Password;

                _context.Accounts.Update(userToUpdate);
                await _context.SaveChangesAsync();
                return userToUpdate;
            }
            return null;
        }
    }
}