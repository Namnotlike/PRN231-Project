using AutoMapper;
using JeanCraftLibrary.Dto;
using JeanCraftLibrary.Models;
using JeanCraftLibrary.Repositories;

namespace JeanCraftServer.Services
{
    public class AddressService : IAddressService
    {
        private readonly IAddressRepository _addressRepository;
        private readonly IMapper _mapper;

        public AddressService(IAddressRepository addressRepository, IMapper mapper)
        {
            _addressRepository = addressRepository;
            _mapper = mapper;
        }

        public async Task<IEnumerable<Address>> GetAddressesByUserId(Guid userId)
        {
            return await _addressRepository.GetAddressesByUserId(userId);
        }

        public async Task<Address> GetAddressByIdAndUserId(Guid id, Guid userId)
        {
            var address = await _addressRepository.GetAddressById(id);
            if (address != null && address.UserId == userId)
            {
                return address;
            }
            return null;
        }

        public async Task<Address> CreateAddress(Address addressdto)
        {
            if (addressdto.UserId == null || addressdto.UserId == Guid.Empty)
            {
                throw new ArgumentException("UserId is required and cannot be empty.");
            }

            var newAddress = new Address
            {
                Id = Guid.NewGuid(),
                UserId = addressdto.UserId,
                Type = addressdto.Type,
                Detail = addressdto.Detail
            };

            return await _addressRepository.CreateAddress(newAddress);
        }

        public async Task<AddressDTO> UpdateAddress(Guid id, AddressDTO addressdto)
        {
            var address = await _addressRepository.GetAddressById(id);
            if (address == null)
            {
                return null;
            }

            if (!string.IsNullOrEmpty(addressdto.Type))
            {
                address.Type = addressdto.Type;
            }
            if (!string.IsNullOrEmpty(addressdto.Detail))
            {
                address.Detail = addressdto.Detail;
            }


            await _addressRepository.UpdateAddress(address);

            // Trả về đối tượng AddressDTO đã được cập nhật
            return _mapper.Map<AddressDTO>(address);
        }
    

        public async Task<bool> DeleteAddress(Guid id, Guid userId)
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
