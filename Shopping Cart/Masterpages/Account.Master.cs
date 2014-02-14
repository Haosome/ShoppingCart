using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shopping_Cart.Masterpages
{
    public partial class Account : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TreeNode buy = new TreeNode("Buy");
                TreeNode buyOrders = new TreeNode("Current orders");
                TreeNode buyHistory = new TreeNode("History");
                buyOrders.NavigateUrl = "~/Account/BuyOrders.aspx";
                buy.ChildNodes.Add(buyOrders);              
                buyHistory.NavigateUrl = "~/Account/BuyHistory.aspx";
                buy.ChildNodes.Add(buyHistory);
                AccountNavigation.Nodes.Add(buy);
                TreeNode sell = new TreeNode("Sell");
                TreeNode sellOrders = new TreeNode("Current orders");
                TreeNode sellHistory = new TreeNode("History");
                TreeNode sellAnItem = new TreeNode("Sell An Item");
                TreeNode itemsList = new TreeNode("Item List");
                sellOrders.NavigateUrl = "~/Account/SellOrders.aspx";
                sell.ChildNodes.Add(sellOrders);   
                sellHistory.NavigateUrl = "~/Account/SellHistory.aspx";
                sell.ChildNodes.Add(sellHistory);         
                sellAnItem.NavigateUrl = "~/Account/SellAnItem.aspx";
                sell.ChildNodes.Add(sellAnItem);
                itemsList.NavigateUrl = "~/Account/ItemsList.aspx";
                sell.ChildNodes.Add(itemsList);
                AccountNavigation.Nodes.Add(sell);
                TreeNode PersonalInformation = new TreeNode("Personal Information");
                PersonalInformation.NavigateUrl = "~/Account/PersonalInformation.aspx";
                AccountNavigation.Nodes.Add(PersonalInformation);
                TreeNode ChangePassword = new TreeNode("Change Password");
                ChangePassword.NavigateUrl = "~/Account/ChangePassword.aspx";
                AccountNavigation.Nodes.Add(ChangePassword);
            }
        }
    }
}