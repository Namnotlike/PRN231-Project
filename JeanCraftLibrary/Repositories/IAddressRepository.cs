using JeanCraftLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JeanCraftLibrary.Repositories
{
    public interface IAddressRepository
    {
        Task<IEnumerable<Address>> GetAddressesByUserId(Guid userId);
        Task<Address> GetAddressById(string addressId);
        Task<Address> CreateAddress(Address address);
        Task<Address> UpdateAddress(Address address);
        Task<bool> DeleteAddress(string addressId);
    }
}
