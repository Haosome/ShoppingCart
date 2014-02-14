using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping_Cart
{
    public partial class Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageLabel.Text = Request.QueryString["Message"]+". Redirecting...";
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect(Request.QueryString["Redirect"]);
        }
    }
}