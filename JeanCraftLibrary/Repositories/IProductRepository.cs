using JeanCraftLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JeanCraftLibrary.Repositories
{
    public interface IProductRepository
    {
        Task<Product?> CreateProduct(Product product);
        Task<Product?> DeleteProduct(Product product);
        Task<Product[]?> GetProductList();
        Task<Product?> GetProductByID(Guid id);
        Task<Product[]?> GetProductByName(string name);
        Task<Product?> UpdateProduct(Product product);
    }
}
