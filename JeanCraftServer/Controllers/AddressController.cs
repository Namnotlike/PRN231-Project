using JeanCraftLibrary.Models;
using JeanCraftServer.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace JeanCraftServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AddressController : ControllerBase
    {
        //private readonly IAddressService _addressService;

        //public AddressController(IAddressService addressService)
        //{
        //    _addressService = addressService;
        //}

        //private Guid GetCurrentUserId()
        //{
        //    return User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        //}

        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<Address>>> GetMyAddresses()
        //{
        //    var userId = GetCurrentUserId();
        //    if (string.IsNullOrEmpty(userId))
        //    {
        //        return Unauthorized();
        //    }

        //    var addresses = await _addressService.GetAddressesByUserId(userId);
        //    return Ok(addresses);
        //}

        //[HttpGet("{id}")]
        //public async Task<ActionResult<Address>> GetMyAddress(string id)
        //{
        //    var userId = GetCurrentUserId();
        //    if (string.IsNullOrEmpty(userId))
        //    {
        //        return Unauthorized();
        //    }

        //    var address = await _addressService.GetAddressByIdAndUserId(id, userId);
        //    if (address == null)
        //    {
        //        return NotFound();
        //    }
        //    return Ok(address);
        //}

        //[HttpPost]
        //public async Task<ActionResult<Address>> CreateMyAddress(Address address)
        //{
        //    var userId = GetCurrentUserId();
        //    if (string.IsNullOrEmpty(userId))
        //    {
        //        return Unauthorized();
        //    }
        //    address.UserId = userId;

        //    var newAddress = await _addressService.CreateAddress(address);
        //    return CreatedAtAction(nameof(GetMyAddress), new { id = newAddress.Id }, newAddress);
        //}

        //[HttpPut("{id}")]
        //public async Task<IActionResult> UpdateMyAddress(string id, Address address)
        //{
        //    var userId = GetCurrentUserId();
        //    if (string.IsNullOrEmpty(userId))
        //    {
        //        return Unauthorized();
        //    }

        //    if (id != address.Id)
        //    {
        //        return BadRequest("Mismatched ID in the request");
        //    }

        //    address.UserId = userId; // Ensures the address is linked to the correct user
        //    var result = await _addressService.UpdateAddress(address);
        //    if (result == null)
        //    {
        //        return NotFound();
        //    }

        //    return NoContent();
        //}

        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteMyAddress(string id)
        //{
        //    var userId = GetCurrentUserId();
        //    if (string.IsNullOrEmpty(userId))
        //    {
        //        return Unauthorized();
        //    }

        //    var success = await _addressService.DeleteAddress(id, userId);
        //    if (!success)
        //    {
        //        return NotFound();
        //    }

        //    return NoContent();
        //}
    }
}
