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
    public partial class BuyOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EntityDataSource1.WhereParameters.Add("UserID", DbType.Guid, System.Web.Security.Membership.GetUser().ProviderUserKey.ToString());
                
            }
            EntityDataSource1.Where = "it.UserID = @UserID&&it.Shipped = false";
        }
    }
}