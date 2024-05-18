using JeanCraftLibrary.Models;

namespace JeanCraftServer.Services
{
    public interface IProductService
    {
        Task<Product?> CreateProduct(Product product);
        Task<Product?> DeleteProduct(Product product);
        Task<Product[]?> GetProductList();
        Task<Product?> GetProductByID(Guid id);
        Task<Product[]?> GetProductByName(string name);
        Task<Product?> UpdateProduct(Product product);
    }
}
