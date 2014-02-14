using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using Shopping_Cart.Model;

namespace Shopping_Cart.Account
{
    public partial class ItemsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ProductEntityDataSource.WhereParameters.Add("SellerID", DbType.Guid, Membership.GetUser().ProviderUserKey.ToString());
            }
            ProductEntityDataSource.Where = "it.SellerID=@SellerID";
        }

        protected void CategoryList_DataBound(object sender, EventArgs e)
        {
            using (ShoppingCartEntities entities = new ShoppingCartEntities())
            {

                int ProductID = Convert.ToInt32(ListView1.DataKeys[ListView1.EditIndex].Value.ToString());
                var CategoryID = from p in entities.Products
                                 where p.ProductID == ProductID
                                 select p.CategoryID;
                string r = CategoryID.First().ToString();
                ((DropDownList)sender).Items.FindByValue(r).Selected = true; ;
            }
            
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            e.NewValues.Add("CategoryID", ((DropDownList)ListView1.EditItem.FindControl("CategoryList")).SelectedValue);
        }
    }
}