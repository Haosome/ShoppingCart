<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginHeadBar.ascx.cs" Inherits="Shopping_Cart.UserControl.LoginHeadBar" %>
     <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 115px;
        }

        .auto-style4 {
            width: 145px;
        }

        .auto-style5 {
            width: 115px;
        }
    </style>

<asp:LoginView ID="LoginView1" runat="server">
    <AnonymousTemplate>
        <header id="HeadBar">
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:LoginStatus ID="LoginStatus1" runat="server" CssClass="LinkButton"/>
                    </td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx" CssClass="LinkButton">Home</asp:HyperLink>
                    </td>
                    <td><asp:HyperLink ID="MyCart" runat="server" CssClass="LinkButton" NavigateUrl="~/Cart.aspx">MyCart</asp:HyperLink></td>
                    <td class="auto-style4">
                        <asp:HyperLink ID="MyAccount" runat="server" NavigateUrl="~/Account/BuyOrders.aspx" CssClass="LinkButton">My Account</asp:HyperLink>
                    </td>
                    <td class="auto-style5">
                        <asp:HyperLink ID="AboutUs" runat="server" CssClass="LinkButton">About Us</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </header>
    </AnonymousTemplate>
    <LoggedInTemplate>
          <header id="HeadBar">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Hi,<asp:LoginName ID="LoginName1" runat="server" />
                    </td>
                    <td>
                        <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutText="Change User" LogoutAction="RedirectToLoginPage" CssClass="LinkButton" ForeColor="White" />
                    </td>
                    <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx" CssClass="LinkButton">Home</asp:HyperLink></td>
                    <td><asp:HyperLink ID="MyCart" runat="server" CssClass="LinkButton" NavigateUrl="~/Cart.aspx">MyCart</asp:HyperLink></td>
                    <td class="auto-style4">
                        <asp:HyperLink ID="MyAccount" runat="server" NavigateUrl="~/Account/BuyOrders.aspx" CssClass="LinkButton">My Account</asp:HyperLink>
                    </td>
                    <td class="auto-style5">
                        <asp:HyperLink ID="AboutUs" runat="server" CssClass="LinkButton">About Us</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </header>
    </LoggedInTemplate>
</asp:LoginView>

