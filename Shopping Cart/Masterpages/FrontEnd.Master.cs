using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shopping_Cart.Model;

namespace Shopping_Cart.Masterpages
{
    public partial class FrontEnd : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ShoppingCartEntities myEntities = new ShoppingCartEntities())
                {
                    var allCategories = myEntities.Categories.Select(c => new { c.CategoryName, c.CategoryID });

                    foreach (var c in allCategories)
                    {
                        MenuItem item = new MenuItem(c.CategoryName);
                        item.NavigateUrl = "~/CategoryContent.aspx?CategoryID="+c.CategoryID;
                        CategoryMenu.Items.Add(item);

                        var products = from Product in myEntities.Products
                                       where Product.CategoryID == c.CategoryID
                                       select new { Product.ProductName, Product.ProductID };

                        foreach (var p in products)
                        {
                            MenuItem mi = new MenuItem(p.ProductName);
                            mi.NavigateUrl = "~/ProductDetails.aspx?ProductID=" + p.ProductID;
                            CategoryMenu.FindItem(c.CategoryName).ChildItems.Add(mi);
                        }
                    }
                }
            }
        }
    }
}