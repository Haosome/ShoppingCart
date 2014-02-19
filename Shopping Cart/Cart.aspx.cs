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
                        CartItems.Add(new Product(product.First().ProductName, product.First().Price, product.First().ImagePath, Request.Cookies["CartItems"].Values.Keys[i]));
                    }
                }
                ListView1.DataSource = CartItems;
                ListView1.DataBind();
            }
            else
            {
                Checkout.Visible = false;
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
                    string UserId = Membership.GetUser().ProviderUserKey.ToString();
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
                            Order o = new Order() { OrderID = Guid.NewGuid(), ProductID = Convert.ToInt32(Request.Cookies["CartItems"].Values[i]), UserID = new Guid(UserId), CreatedTime = DateTime.Now };
                            entities.AddToOrders(o);
                            entities.SaveChanges();
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