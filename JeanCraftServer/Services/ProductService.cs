using JeanCraftLibrary.Models;
using JeanCraftLibrary.Repositories;

namespace JeanCraftServer.Services
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _productRepository;

        public ProductService(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public async Task<Product?> CreateProduct(Product product)
        {
            throw new NotImplementedException();
        }

        public async Task<Product?> DeleteProduct(Product product)
        {
            throw new NotImplementedException();
        }

        public async Task<Product?> GetProductByID(Guid id)
        {
            throw new NotImplementedException();
        }

        public async Task<Product[]?> GetProductByName(string name)
        {
            throw new NotImplementedException();
        }

        public async Task<Product[]?> GetProductList()
        {
            return await _productRepository.GetProductList();
        }

        public async Task<Product?> UpdateProduct(Product product)
        {
            throw new NotImplementedException();
        }
    }
}
