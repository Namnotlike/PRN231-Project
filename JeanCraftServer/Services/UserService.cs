using JeanCraftLibrary.Repositories;
using JeanCraftLibrary.Dto;
using JeanCraftLibrary.Models;

namespace JeanCraftServer.Services
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository;

        public UserService(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<Account?> ChangePassword(ChangePWForm userDto)
        {
            Account? userOld = await GetUserByID(userDto.UserID);
            if (userOld == null)
            {
                return null;
            }

            if (!VerifyPassword(userOld.Password, userDto.OldPassword))
            {
                return null;
            }
            return await _userRepository.ChangePassword(userOld, HashPassword(userDto.NewPassword));
        }

        public async Task<Account> CreateUserGoogle(GoogleLoginForm userDto)
        {
            Account user = new Account
            {
                UserId = Guid.NewGuid(),
                UserName = userDto.FullName,
                Email = userDto.Email,
                Password = HashPassword("123456"),
                Status = true,
                RoleId = Guid.Parse(Constants.ROLE_USER),
            };
            return await _userRepository.CreateUserGoogle(user);
        }

        public async Task<Account?> GetUserByEmail(string email)
        {
            return await _userRepository.GetUserByEmail(email);
        }

        public async Task<Account?> GetUserByID(Guid userID)
        {
            return await _userRepository.GetUserByID(userID);
        }

        public async Task<Account> RegisterUser(string? fileName, Account user)
        {
            Account account = new Account()
            {
                RoleId = Guid.Parse(Constants.ROLE_USER),
                UserId = user.UserId,
                UserName = user.UserName,
                Email = user.Email,
                Password = HashPassword(user.Password),
                Image = user.Image,
                Status = user.Status,
            };
            return await _userRepository.RegisterUser(fileName, user);
        }

        public async Task<Account?> UpdateUserProfile(Account user)
        {
            return await _userRepository.UpdateUser(user);
        }

        private string HashPassword(string password)
        {
            return BCrypt.Net.BCrypt.HashPassword(password);
        }

        private bool VerifyPassword(string hashedPassword, string password)
        {
            return BCrypt.Net.BCrypt.Verify(password, hashedPassword);
        }
    }
}
