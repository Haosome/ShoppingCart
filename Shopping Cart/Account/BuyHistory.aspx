<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Account.Master" AutoEventWireup="true" CodeBehind="BuyHistory.aspx.cs" Inherits="Shopping_Cart.Account.BuyHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableFlattening="False" EntitySetName="Orders" Include="Product, Product.User"></asp:EntityDataSource>
            Period:
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="7">Past Week</asp:ListItem>
                <asp:ListItem Value="30">Last 30 Days</asp:ListItem>
                <asp:ListItem Value="90">Last 90 Days</asp:ListItem>
                <asp:ListItem>Last 3 years</asp:ListItem>
            </asp:DropDownList>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="OrderID" DataSourceID="EntityDataSource1">
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <tr >
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
