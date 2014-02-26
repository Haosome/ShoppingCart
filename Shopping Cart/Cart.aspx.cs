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
    public class Product
    {
        public string ID { set; get; }
        public string ProductName { set; get; }
        public double Price { set; get; }
        public string ImagePath { set; get; }
        public Product(string name, double price, string path, string id)
        {
            this.ProductName = name;
            this.Price = price;
            this.ImagePath = path;
            this.ID = id;
        }
    }

    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["CartItems"] != null && Request.Cookies["CartItems"].Values != null)
            {
                double total = 0;

                Checkout.Visible = true;
                NoItem.Visible = false;
                List<Product> CartItems = new List<Product>();
                using (ShoppingCartEntities entities = new ShoppingCartEntities())
                {

                    for (int i = 0; i < Request.Cookies["CartItems"].Values.Count; i++)
                    {
                        string t = Request.Cookies["CartItems"].Values[i];
                        int ProductID = Convert.ToInt32(Request.Cookies["CartItems"].Values[i]);
                        var product = from p in entities.Products
                                      where p.ProductID == ProductID
                                      select new { p.ProductName, p.Price, p.ImagePath };
                        total += product.First().Price;
                        CartItems.Add(new Product(product.First().ProductName, product.First().Price, product.First().ImagePath, Request.Cookies["CartItems"].Values.Keys[i]));
                    }
                }
                ListView1.DataSource = CartItems;
                ListView1.DataBind();
                Total.Text = "Your total is: " + total.ToString();
            }
            else
            {
                Checkout.Visible = false;
                Total.Visible = false;
                NoItem.Visible = true;
            }

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["CartItems"];
            if (cookie.Values != null)
            {
                string ID = ((HiddenField)((Button)sender).Parent.FindControl("ID")).Value;
                cookie.Values.Remove(ID);
                if (cookie.Values.Count == 0)
                {
                    Response.Cookies["CartItems"].Expires = DateTime.Now.AddDays(-1d);
                }
                else
                {
                    Response.Cookies.Add(cookie);
                }
            }
            HttpCookie t = Request.Cookies["CartItems"];
            Response.Redirect(Request.RawUrl);
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                using (ShoppingCartEntities entities = new ShoppingCartEntities())
                {
                    string UserId = System.Web.Security.Membership.GetUser().ProviderUserKey.ToString();
                    var Address = from profile in entities.MyProfiles
                                  where profile.UserID == new Guid(UserId)
                                  select new { profile.ShippingAddress, profile.ShippingPhoneNumber, profile.ShippingPostalCode };
                    if (Address.First().ShippingAddress == null || Address.First().ShippingPhoneNumber == null || Address.First().ShippingPostalCode == null)
                    {
                        Response.Redirect("~/Message.aspx?Message=Please fill in your shipping address&Redirect=~/Account/PersonalInformation.aspx");
                    }
                    if (Request.Cookies["CartItems"] != null)
                    {

                        for (int i = 0; i < Request.Cookies["CartItems"].Values.Count; i++)
                        {
                            int productID = Convert.ToInt32(Request.Cookies["CartItems"].Values[i]);

                            Order o = new Order() { OrderID = Guid.NewGuid(), ProductID = productID, UserID = new Guid(UserId), CreatedTime = DateTime.Now };
                            entities.AddToOrders(o);
                            entities.SaveChanges();

                            var ProductnEMail = entities.Memberships.
                           Join(entities.Products, m => m.UserId, p => p.SellerID, (m, p) => new { Email = m.Email, PID = p.ProductID, ProductName = p.ProductName }).Where(x => x.PID == productID).
                           Select(x => new { x.Email, x.ProductName });
                            string FileName = Server.MapPath("~/App_Data/NewOrder.txt");
                            var UserName = entities.Users.Where(u => u.UserId == new Guid(UserId)).Select(u => u.UserName);
                            string MailBody = File.ReadAllText(FileName);
                            string ShippingAddress = Address.First().ShippingAddress + Address.First().ShippingPostalCode + Address.First().ShippingPhoneNumber;
                            MailBody = MailBody.Replace("<% BuyerName %>", UserName.First());
                            MailBody = MailBody.Replace("<% ProductName %>", ProductnEMail.First().ProductName);
                            MailBody = MailBody.Replace("<% ShippingAddress %>", ShippingAddress);
                            MailMessage newMessage = new MailMessage();
                            newMessage.Body = MailBody;
                            newMessage.Subject = "New Order";
                            newMessage.To.Add(new MailAddress(ProductnEMail.First().Email));
                            newMessage.From = new MailAddress("shoppingcarthaosome@gmail.com", "ShoppingCart");
                            SmtpClient client = new SmtpClient();
                            client.Send(newMessage);
                        }
                        Response.Cookies["CartItems"].Expires = DateTime.Now.AddDays(-1d);
                        Response.Redirect(Request.RawUrl);
                    }
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=~/Cart.aspx");
            }
        }
    }
}