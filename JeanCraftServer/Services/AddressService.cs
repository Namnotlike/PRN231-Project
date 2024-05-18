using JeanCraftLibrary.Models;
using JeanCraftLibrary.Repositories;

namespace JeanCraftServer.Services
{
    public class AddressService : IAddressService
    {
        private readonly IAddressRepository _addressRepository;

        public AddressService(IAddressRepository addressRepository)
        {
            _addressRepository = addressRepository;
        }

        public async Task<IEnumerable<Address>> GetAddressesByUserId(Guid userId)
        {
            return await _addressRepository.GetAddressesByUserId(userId);
        }

        public async Task<Address> GetAddressByIdAndUserId(string id, Guid userId)
        {
            var address = await _addressRepository.GetAddressById(id);
            if (address != null && address.UserId == userId)
            {
                return address;
            }
            return null;
        }

        public async Task<Address> CreateAddress(Address address)
        {
            return await _addressRepository.CreateAddress(address);
        }

        public async Task<Address> UpdateAddress(Address address)
        {
            return await _addressRepository.UpdateAddress(address);
        }

        public async Task<bool> DeleteAddress(string id, Guid userId)
        {
            var address = await GetAddressByIdAndUserId(id, userId);
            if (address == null)
            {
                return false;
            }
            return await _addressRepository.DeleteAddress(id);
        }
    }
}
