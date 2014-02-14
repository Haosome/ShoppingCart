using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shopping_Cart.Model;

namespace Shopping_Cart
{
    public partial class CategoryContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (ShoppingCartEntities entities = new ShoppingCartEntities())
            {
                int CategoryID = Convert.ToInt32(Request.QueryString["CategoryID"]);
                var CategoryName = from c in entities.Categories
                                   where c.CategoryID == CategoryID
                                   select c.CategoryName;
                Page.Title = CategoryName.First();
            }
        }
    }
}