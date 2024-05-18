using JeanCraftLibrary.Models;

namespace JeanCraftServer.Services
{
    public interface IAddressService
    {
        Task<IEnumerable<Address>> GetAddressesByUserId(Guid userId);
        Task<Address> GetAddressByIdAndUserId(string id, Guid userId);
        Task<Address> CreateAddress(Address address);
        Task<Address> UpdateAddress(Address address);
        Task<bool> DeleteAddress(string id, Guid userId);
    }
}
