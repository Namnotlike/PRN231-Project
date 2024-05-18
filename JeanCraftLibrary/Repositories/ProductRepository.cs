using JeanCraftLibrary.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JeanCraftLibrary.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly JeanCraftContext _context;

        public ProductRepository(JeanCraftContext context)
        {
            _context = context;
        }
        public async Task<Product> CreateProduct(Product product)
        {
            throw new NotImplementedException();
        }

        public async Task<Product> DeleteProduct(Product product)
        {
            throw new NotImplementedException();
        }

        public async Task<Product?> GetProductByID(Guid id)
        {
            throw new NotImplementedException();
        }

        public async Task<Product[]> GetProductByName(string name)
        {
            throw new NotImplementedException();
        }

        public async Task<Product[]?> GetProductList()
        {
            
            //var query = from product in _context.Products
            //            join designOnes in _context.DesignOnes on product.DesignOneId equals designOnes.DesignOneId
            //            join designTwos in _context.DesignTwos on product.DesignTwoId equals designTwos.DesignTwoId
            //            join designThrees in _context.DesignThrees on product.DesignThreeId equals designThrees.DesignThreeId
            //            select product;
            var a = from designOnes in _context.DesignOnes
                    join fit in _context.Components on designOnes.Fit equals fit.ComponentId
                    join length in _context.Components on designOnes.Length equals length.ComponentId
                    join cuffs in _context.Components on designOnes.Cuffs equals cuffs.ComponentId
                    join fly in _context.Components on designOnes.Fly equals fly.ComponentId
                    join frontPocket in _context.Components on designOnes.FrontPocket equals frontPocket.ComponentId
                    join backPocket in _context.Components on designOnes.BackPocket equals backPocket.ComponentId
                    select designOnes;
            var b = from designTwos in _context.DesignTwos
                    join finishing in _context.Components on designTwos.Finishing equals finishing.ComponentId
                    join fabricColor in _context.Components on designTwos.FabricColor equals fabricColor.ComponentId
                    select designTwos;
            var c = from designThrees in _context.DesignThrees
                    join monoGram in _context.Components on designThrees.MonoGram equals monoGram.ComponentId
                    join embroideryFont in _context.Components on designThrees.EmbroideryFont equals embroideryFont.ComponentId
                    join embroideryColor in _context.Components on designThrees.EmbroideryColor equals embroideryColor.ComponentId
                    join stitchingThreadColor in _context.Components on designThrees.StitchingThreadColor equals stitchingThreadColor.ComponentId
                    join buttonAndRivet in _context.Components on designThrees.ButtonAndRivet equals buttonAndRivet.ComponentId
                    join branchBackPatch in _context.Components on designThrees.BranchBackPatch equals branchBackPatch.ComponentId
                    select designThrees;
            var query = from products in _context.Products
                         join design1 in a on products.DesignOneId equals design1.DesignOneId
                         join design2 in b on products.DesignTwoId equals design2.DesignTwoId
                         join design3 in c on products.DesignThreeId equals design3.DesignThreeId
                         select products;
            return await query.ToArrayAsync();
            
        }

        public async Task<Product> UpdateProduct(Product product)
        {
            throw new NotImplementedException();
        }
    }
}
