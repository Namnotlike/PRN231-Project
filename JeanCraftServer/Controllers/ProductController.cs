using JeanCraftLibrary.Dto;
using JeanCraftLibrary.Models;
using JeanCraftServer.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace JeanCraftServer.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IProductService _productService;
        private readonly IConfiguration _configuration;

        public ProductController(IProductService productService, IConfiguration configuration)
        {
            _productService = productService;
            _configuration = configuration;
        }

        [HttpGet("getProductList")]
        public async Task<IActionResult> GetProductList()
        {
            Product[] products = await _productService.GetProductList();
            return Ok(ResponseArrayHandle<Product>.Success(products));
        }
    }
}
