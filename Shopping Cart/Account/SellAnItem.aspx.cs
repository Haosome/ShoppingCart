using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shopping_Cart.Model;
using System.Web.Security;

namespace Shopping_Cart.Account
{
    public partial class SellAnItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload ImageUpload = (FileUpload)DetailsView1.FindControl("ImageUpload");
            string FileExtension = System.IO.Path.GetExtension(ImageUpload.FileName);
            string FileName = Guid.NewGuid().ToString();
            string VirtualFolder = "~/ProductsImages/";
            string PhycialFolder = Server.MapPath(VirtualFolder);
            ImageUpload.SaveAs(System.IO.Path.Combine(PhycialFolder,FileName+FileExtension));

            e.Values.Add("ImagePath", VirtualFolder + FileName + FileExtension);
            e.Values.Add("SellerID", System.Web.Security.Membership.GetUser().ProviderUserKey.ToString());
            e.Values.Add("CategoryID", DropDownList1.SelectedValue);
        }
    }
}