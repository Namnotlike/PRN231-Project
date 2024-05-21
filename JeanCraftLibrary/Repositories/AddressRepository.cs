using AutoMapper;
using JeanCraftLibrary.Dto;
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
        private readonly IMapper _mapper;

        public AddressRepository(JeanCraftContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<IEnumerable<Address>> GetAddressesByUserId(Guid userId)
        {
            return await _context.Addresses
                .Where(a => a.UserId == userId)
                .ToListAsync();
        }

        public async Task<Address> GetAddressById(Guid addressId)
        {
            return await _context.Addresses.AsNoTracking().FirstOrDefaultAsync(a => a.Id == addressId);
        }

        public async Task<Address> CreateAddress(Address address)
        {
            _context.Addresses.Add(address);
            await _context.SaveChangesAsync();
            return address;
        }

        public async Task<Address> UpdateAddress(Address address)
        {
            var existingEntity = await _context.Addresses.FirstOrDefaultAsync(a => a.Id == address.Id);
            if (existingEntity != null)
            {
                _context.Entry(existingEntity).CurrentValues.SetValues(address);
            }
            else
            {
                _context.Addresses.Update(address);
            }
            await _context.SaveChangesAsync();
            return address;
        }

        public async Task<bool> DeleteAddress(Guid addressId)
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
