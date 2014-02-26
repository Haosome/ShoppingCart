using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using Shopping_Cart.Model;

namespace Shopping_Cart.Account
{
    public partial class SellOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EntityDataSource1.WhereParameters.Add("SellerID", DbType.Guid, System.Web.Security.Membership.GetUser().ProviderUserKey.ToString());
                EntityDataSource1.Where = "it.Product.SellerID = @SellerID && it.Shipped = false";
            }
            
        }

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (string.Equals("UpdateTrackingNumber", e.CommandName))
            {
                ListViewDataItem DataItem = (ListViewDataItem)e.Item;
                Button bt = (Button)e.CommandSource;
                string TrackingNumber = ((TextBox)bt.Parent.FindControl("TrackingNumberTextBox")).Text;
                string OrderID = ListView1.DataKeys[DataItem.DisplayIndex].Value.ToString();
                if (OrderID != null && TrackingNumber != null)
                {
                    using (ShoppingCartEntities entities = new ShoppingCartEntities())
                    {
                        var order = from o in entities.Orders
                                             where o.OrderID.Equals(new Guid(OrderID))
                                             select o;
                        foreach (var t in order)
                        {
                            t.TrackingNumber = TrackingNumber;
                            t.Shipped = true;
                        }
                        entities.SaveChanges();
                    }
                }
            }
        }
    }
}