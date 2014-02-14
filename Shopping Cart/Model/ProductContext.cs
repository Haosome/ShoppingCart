using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Shopping_Cart.Model
{
    public class ProductContext : DbContext
    {
        public ProductContext()
            : base("ShoppingCart")
        {
        }
        public DbSet<Product> Products { set; get; }
        public DbSet<Category> Categories { set; get; }
        public DbSet<Order> Orders { set; get; }
    }
}