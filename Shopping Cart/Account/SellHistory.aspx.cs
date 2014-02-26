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
    public partial class SellHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["PeriodMode"] = false;
                EntityDataSource1.WhereParameters.Add("SellerID", DbType.Guid, System.Web.Security.Membership.GetUser().ProviderUserKey.ToString());
                EntityDataSource1.WhereParameters.Add("Now", DbType.Date, DateTime.Now.ToString());
                EntityDataSource1.WhereParameters.Add("To", DbType.Date, DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0)).ToString());
                EntityDataSource1.Where = "it.Product.SellerID = @SellerID && it.Shipped = true && it.CreatedTime BETWEEN @To AND @Now";
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String SelectedValue = DropDownList1.SelectedValue;
            if (SelectedValue != "Last 3 years")
            {
                if ((bool)ViewState["PeriodMode"] == false)
                {
                    int Days = Convert.ToInt16(DropDownList1.SelectedValue);
                    EntityDataSource1.WhereParameters.Clear();
                    EntityDataSource1.WhereParameters.Add("UserID", DbType.Guid, System.Web.Security.Membership.GetUser().ProviderUserKey.ToString());
                    EntityDataSource1.WhereParameters.Add("Now", DbType.Date, DateTime.Now.ToString());
                    EntityDataSource1.WhereParameters.Add("To", DbType.Date, DateTime.Now.Subtract(new TimeSpan(Days, 0, 0, 0)).ToString());
                    EntityDataSource1.Where = "it.UserID=@UserID&&it.Shipped=true&&it.CreatedTime BETWEEN @To AND @Now  ";
                }
                else
                {
                    int year = Convert.ToInt16(DropDownList1.SelectedItem.Text);
                    EntityDataSource1.WhereParameters.Clear();
                    EntityDataSource1.WhereParameters.Add("From", DbType.Date, new DateTime(year, 1, 1).ToString());
                    EntityDataSource1.WhereParameters.Add("To", DbType.Date, new DateTime(year, 12, 31).ToString());
                    EntityDataSource1.WhereParameters.Add("UserID", DbType.Guid, System.Web.Security.Membership.GetUser().ProviderUserKey.ToString());
                    EntityDataSource1.Where = "it.UserID=@UserID&&it.Shipped=true&&it.CreatedTime BETWEEN @From AND @To";
                }
            }
            else
            {
                DropDownList1.Items.Clear();
                String ItemText = DateTime.Now.Subtract(new TimeSpan(365, 0, 0, 0)).Year.ToString();
                DropDownList1.Items.Add(new ListItem(ItemText, "365"));
                ItemText = DateTime.Now.Subtract(new TimeSpan(730, 0, 0, 0)).Year.ToString();
                DropDownList1.Items.Add(new ListItem(ItemText, "730"));
                ItemText = DateTime.Now.Subtract(new TimeSpan(1095, 0, 0, 0)).Year.ToString();
                DropDownList1.Items.Add(new ListItem(ItemText, "1095"));
                ViewState["PeriodMode"] = true;
                this.DropDownList1_SelectedIndexChanged(null, null);
            }
        }
    }
}