<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/FrontEnd.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Shopping_Cart.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
            <tr>
                <td class="Thumbnail">
                    <asp:Image ID="Thumbnail" runat="server" ImageUrl='<%#Eval("ImagePath") %>' Width="100%" />
                </td>
                <td>
                    <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                </td>
                <td>
                    <asp:Label ID="ProductLabel" runat="server" Text='<%# Eval("Price","${0}") %>' />
                </td>
                <td>
                    <asp:HiddenField ID="ID" runat="server" Value='<%# Eval("ID") %>' />
                </td>
                <td>
                    <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="ListView">
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
    <asp:Button ID="Checkout" runat="server" Text="Check Out" OnClick="Checkout_Click" Visible="false"/>
    <asp:Label ID="NoItem" runat="server" Text="There are no items in your cart" Visible="true"></asp:Label>
</asp:Content>
