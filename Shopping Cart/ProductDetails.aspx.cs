using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Shopping_Cart.Model;
using System.Web.Security;
using System.IO;
using System.Net.Mail;

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
                string UserId = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
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
                        int productID = Convert.ToInt32(Request.QueryString[0]);
                        Order o = new Order() { OrderID = Guid.NewGuid(), ProductID = productID, UserID = new Guid(UserId), CreatedTime = DateTime.Now };
                        entities.AddToOrders(o);
                        entities.SaveChanges();

                        var ProductnEMail = entities.Memberships.
                            Join(entities.Products, m => m.UserId, p => p.SellerID, (m, p) => new { Email = m.Email, PID = p.ProductID, ProductName = p.ProductName }).Where(x => x.PID == productID).
                            Select(x => new { x.Email,x.ProductName});
                        string FileName = Server.MapPath("~/App_Data/NewOrder.txt");
                        var UserName = entities.Users.Where(u => u.UserId == new Guid(UserId)).Select(u=>u.UserName);
                        string MailBody = File.ReadAllText(FileName);
                        string ShippingAddress = Address.First().ShippingAddress + Address.First().ShippingPostalCode + Address.First().ShippingPhoneNumber;
                        MailBody = MailBody.Replace("<% BuyerName %>",UserName.First());
                        MailBody = MailBody.Replace("<% ProductName %>", ProductnEMail.First().ProductName);
                        MailBody = MailBody.Replace("<% ShippingAddress %>",ShippingAddress);
                        MailMessage newMessage = new MailMessage();
                        newMessage.Body = MailBody;
                        newMessage.Subject = "New Order";
                        newMessage.To.Add(new MailAddress(ProductnEMail.First().Email));
                        newMessage.From = new MailAddress("shoppingcarthaosome@gmail.com","ShoppingCart");
                        SmtpClient client = new SmtpClient();
                        client.Send(newMessage);
                        Response.Redirect("~/Account/BuyOrders.aspx");
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