<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Account.Master" AutoEventWireup="true" CodeBehind="BuyOrders.aspx.cs" Inherits="Shopping_Cart.Account.BuyOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableFlattening="False" EntitySetName="Orders" Include="Product, Product.User">
    </asp:EntityDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="OrderID" DataSourceID="EntityDataSource1">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>You do not have any purchases to display in this view.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr>
                <td class="Thumbnail">
                    <asp:Image ID="Thumbnail" runat="server" ImageUrl='<%#Eval("Product.ImagePath") %>' Width="100%"/>
                </td>
                <td>
                    <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("Product.ProductName") %>' />
                </td>
                <td>
                    <asp:Label ID="CreatedTimeLabel" runat="server" Text='<%# Eval("CreatedTime","Sale Date: {0}") %>' />
                </td>
                <td>
                    <asp:Label ID="TrackingNumberLabel" runat="server" Text='<%# Eval("TrackingNumber","TrackingNumber: {0}") %>' />
                </td>
                <td>
                    <asp:Label ID="ProductLabel" runat="server" Text='<%# Eval("Product.Price","${0}") %>' />
                </td>
                <td>
                    <asp:Label ID="UserLabel" runat="server" Text='<%# Eval("User.UserName") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="ListView">
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
