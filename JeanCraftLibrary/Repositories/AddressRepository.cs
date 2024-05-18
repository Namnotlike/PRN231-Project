using JeanCraftLibrary.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JeanCraftLibrary.Repositories
{
    public class AddressRepository : IAddressRepository
    {
        private readonly JeanCraftContext _context;

        public AddressRepository(JeanCraftContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Address>> GetAddressesByUserId(Guid userId)
        {
            return await _context.Addresses
                .Where(a => a.UserId == userId)
                .ToListAsync();
        }

        public async Task<Address> GetAddressById(string addressId)
        {
            return await _context.Addresses.FindAsync(addressId);
        }

        public async Task<Address> CreateAddress(Address address)
        {
            _context.Addresses.Add(address);
            await _context.SaveChangesAsync();
            return address;
        }

        public async Task<Address> UpdateAddress(Address address)
        {
            _context.Addresses.Update(address);
            await _context.SaveChangesAsync();
            return address;
        }

        public async Task<bool> DeleteAddress(string addressId)
        {
            var address = await _context.Addresses.FindAsync(addressId);
            if (address == null)
            {
                return false;
            }
            _context.Addresses.Remove(address);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
