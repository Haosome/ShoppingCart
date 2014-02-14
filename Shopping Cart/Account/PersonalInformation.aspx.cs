using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

namespace Shopping_Cart.Account
{
    public partial class PersonalInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EntityDataSource1.WhereParameters.Add("UserID", DbType.Guid, Membership.GetUser().ProviderUserKey.ToString());
                ViewState["SameAsContactAddress"] = false;
            }
            EntityDataSource1.Where = "it.UserID = @UserID";
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string date = ((TextBox)DetailsView1.FindControl("DateOfBirth")).Text;
            e.NewValues.Add("DateOfBirth", DateTime.ParseExact(date, "dd/MM/yyyy", null));

            if (ViewState["SameAsContactAddress"].ToString().Equals("True"))
            {
                e.NewValues["ShippingAddress"] = e.NewValues["ContactAddress"];
                e.NewValues["ShippingPostalCode"] = e.NewValues["ContactPostalCode"];
                e.NewValues["ShippingPhoneNumber"] = e.NewValues["ContactPhoneNumber"];
            }
            ViewState["SameAsContactAddress"] = false;
        }

        protected void SameAsContactAddress_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox box = sender as CheckBox;
            ViewState["SameAsContactAddress"] = box.Checked;
            ((TextBox)box.Parent.FindControl("ShippingAddress")).Enabled = !((TextBox)box.Parent.FindControl("ShippingAddress")).Enabled;
            ((TextBox)box.Parent.FindControl("ShippingPostalCode")).Enabled = !((TextBox)box.Parent.FindControl("ShippingPostalCode")).Enabled;
            ((TextBox)box.Parent.FindControl("ShippingPhoneNumber")).Enabled = !((TextBox)box.Parent.FindControl("ShippingPhoneNumber")).Enabled;
            ((RequiredFieldValidator)box.Parent.FindControl("RequiredFieldValidator7")).Enabled = !((RequiredFieldValidator)box.Parent.FindControl("RequiredFieldValidator7")).Enabled;
            ((RequiredFieldValidator)box.Parent.FindControl("RequiredFieldValidator8")).Enabled = !((RequiredFieldValidator)box.Parent.FindControl("RequiredFieldValidator8")).Enabled;
            ((RequiredFieldValidator)box.Parent.FindControl("RequiredFieldValidator9")).Enabled = !((RequiredFieldValidator)box.Parent.FindControl("RequiredFieldValidator9")).Enabled;
        }
    }
}