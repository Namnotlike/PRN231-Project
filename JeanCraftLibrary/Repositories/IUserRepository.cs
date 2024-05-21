using JeanCraftLibrary.Dto;
using JeanCraftLibrary.Models;

namespace JeanCraftLibrary.Repositories
{
    public interface IUserRepository
    {
        Task<Account> RegisterUser(string? fileName, Account user);
        Task<Account> CreateUserGoogle(Account user);
        Task<AccountDTO?> GetUserDTOByID(Guid userID);
        Task<Account?> GetUserByID(Guid userID);
        Task<Account?> GetUserByEmail(string email);
        Task<Account?> ChangePassword(Account user, string newPassword);
        Task<Account?> UpdateUser(Account user);
    }
}
