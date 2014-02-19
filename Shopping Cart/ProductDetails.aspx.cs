using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shopping_Cart.Model;
using System.Web.Security;

namespace Shopping_Cart
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btBuyNow_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string UserId = Membership.GetUser().ProviderUserKey.ToString();
                using (ShoppingCartEntities entities = new ShoppingCartEntities())
                {
                    var Address = from profile in entities.MyProfiles
                                  where profile.UserID == new Guid(UserId)
                                  select new { profile.ShippingAddress, profile.ShippingPhoneNumber, profile.ShippingPostalCode };
                    if (Address.First().ShippingAddress == null || Address.First().ShippingPhoneNumber == null || Address.First().ShippingPostalCode == null)
                    {
                        Response.Redirect("~/Message.aspx?Message=Please fill in your shipping address&Redirect=~/Account/PersonalInformation.aspx");
                    }
                    else
                    {
                        Order o = new Order() { OrderID = Guid.NewGuid(), ProductID = Convert.ToInt32(Request.QueryString[0]), UserID = new Guid(UserId), CreatedTime = DateTime.Now };
                        entities.AddToOrders(o);
                        entities.SaveChanges();
                    }

                }
            }
            else
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=~/ProductDetails.aspx?ProductID="+Request.QueryString[0]);
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            string key = Guid.NewGuid().ToString();
            HttpCookie cookie;
            if (Request.Cookies["CartItems"] != null)
            {
               cookie = Request.Cookies["CartItems"];
            }
            else
            {
               cookie = new HttpCookie("CartItems");
            }
            cookie[key] = Request.QueryString[0];
            cookie.Expires = DateTime.Now.AddMonths(1);
            Response.Cookies.Add(cookie);
        }
    }
}