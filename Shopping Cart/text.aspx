<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="text.aspx.cs" Inherits="Shopping_Cart.text" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Products">
        </asp:EntityDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ProductID" DataSourceID="EntityDataSource1" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ImagePathLabel" runat="server" Text='<%# Eval("ImagePath") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SellerIDLabel" runat="server" Text='<%# Eval("SellerID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrdersLabel" runat="server" Text='<%# Eval("Orders") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserLabel" runat="server" Text='<%# Eval("User") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="ProductIDLabel1" runat="server" Text='<%# Eval("ProductID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ImagePathTextBox" runat="server" Text='<%# Bind("ImagePath") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SellerIDTextBox" runat="server" Text='<%# Bind("SellerID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OrdersTextBox" runat="server" Text='<%# Bind("Orders") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserTextBox" runat="server" Text='<%# Bind("User") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ImagePathTextBox" runat="server" Text='<%# Bind("ImagePath") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="SellerIDTextBox" runat="server" Text='<%# Bind("SellerID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="OrdersTextBox" runat="server" Text='<%# Bind("Orders") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserTextBox" runat="server" Text='<%# Bind("User") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ImagePathLabel" runat="server" Text='<%# Eval("ImagePath") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SellerIDLabel" runat="server" Text='<%# Eval("SellerID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrdersLabel" runat="server" Text='<%# Eval("Orders") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserLabel" runat="server" Text='<%# Eval("User") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server"></th>
                                    <th runat="server">ProductID</th>
                                    <th runat="server">ProductName</th>
                                    <th runat="server">CategoryID</th>
                                    <th runat="server">ImagePath</th>
                                    <th runat="server">Description</th>
                                    <th runat="server">Price</th>
                                    <th runat="server">SellerID</th>
                                    <th runat="server">Category</th>
                                    <th runat="server">Orders</th>
                                    <th runat="server">User</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
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
            <SelectedItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ImagePathLabel" runat="server" Text='<%# Eval("ImagePath") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SellerIDLabel" runat="server" Text='<%# Eval("SellerID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                    </td>
                    <td>
                        <asp:Label ID="OrdersLabel" runat="server" Text='<%# Eval("Orders") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserLabel" runat="server" Text='<%# Eval("User") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    
    </div>
    </form>
</body>
</html>
