    <%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/FrontEnd.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Shopping_Cart.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ProductID" DataSourceID="EntityDataSource1" Height="50px" Width="100%" ItemType="Shopping_Cart.Model.Product">
        <Fields>
            <asp:TemplateField ShowHeader="False" SortExpression="ImagePath">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Item.ImagePath %>' Width="100%" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" ShowHeader="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ShowHeader="False" />
            <asp:TemplateField HeaderText="Price" ShowHeader="False" SortExpression="Price">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    <asp:Button ID="btBuyNow" runat="server" Text="BuyNow!" OnClick="btBuyNow_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableFlattening="False" EntitySetName="Products" EntityTypeFilter="" Select="" Where="it.ProductID=@ProductID">
        <WhereParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
