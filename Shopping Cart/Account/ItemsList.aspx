<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Account.Master" AutoEventWireup="true" CodeBehind="ItemsList.aspx.cs" Inherits="Shopping_Cart.Account.ItemsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:EntityDataSource ID="CategoryEntityDataSource" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableFlattening="False" EntitySetName="Categories" Select="it.[CategoryID], it.[CategoryName]"></asp:EntityDataSource>
            <asp:EntityDataSource ID="ProductEntityDataSource" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="Products" Include="Category"></asp:EntityDataSource>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ProductID" DataSourceID="ProductEntityDataSource" OnItemUpdating="ListView1_ItemUpdating">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
                        </td>
                        <td>
                            <asp:DropDownList ID="CategoryList" runat="server" DataSourceID="CategoryEntityDataSource" DataTextField="CategoryName" DataValueField="CategoryID" OnDataBound="CategoryList_DataBound"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>'/>
                        </td>
                        <td>
                            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
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
                <ItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("CategoryID") %>' />
                        </td>
                        <td>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("ImagePath") %>'/>
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
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
                                        <th runat="server">ProductName</th>
                                        <th runat="server">Category</th>
                                        <th runat="server">ImagePath</th>
                                        <th runat="server">Description</th>
                                        <th runat="server">Price</th>
                                    </tr>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
