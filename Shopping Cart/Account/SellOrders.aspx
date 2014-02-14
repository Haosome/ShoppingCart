<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Account.Master" AutoEventWireup="true" CodeBehind="SellOrders.aspx.cs" Inherits="Shopping_Cart.Account.SellOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableFlattening="False" EntitySetName="Orders" Include="Product, User" EnableUpdate="True">
    </asp:EntityDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="OrderID" DataSourceID="EntityDataSource1" OnItemCommand="ListView1_ItemCommand">

       <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Image ID="Thumbnail" runat="server" ImageUrl='<%#Eval("Product.ImagePath") %>' Width="40%" />
                </td>
                <td>
                    <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("Product.ProductName") %>' />
                </td>
                <td>
                    <asp:Label ID="CreatedTimeLabel" runat="server" Text='<%# Eval("CreatedTime","Sale Date: {0}") %>' />
                </td>
                <td>
                    TrackingNumber:
                    <asp:TextBox ID="TrackingNumberTextBox" runat="server" Text='<%# Bind("TrackingNumber") %>' />
                    <asp:Button ID="BtUpdate" runat="server" Text="Update" CommandName="UpdateTrackingNumber" />
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
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td id="Td2" runat="server" style="">
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
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
