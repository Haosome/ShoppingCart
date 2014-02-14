<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/FrontEnd.Master" AutoEventWireup="true" CodeBehind="CategoryContent.aspx.cs" Inherits="Shopping_Cart.CategoryContent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableFlattening="False" EntitySetName="Products" Where="it.CategoryID = @CategoryID" EntityTypeFilter="" Select="">
        <WhereParameters>
            <asp:QueryStringParameter Name="CategoryID" QueryStringField="CategoryID" Type="Int16" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ProductID" DataSourceID="EntityDataSource1">
        <EmptyDataTemplate>
            <span>No products in this categoy.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <span style="">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#"~/ProductDetails.aspx?ProductID="+Eval("ProductID") %>'><asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>' CssClass ="Thumbnail"/></asp:HyperLink>
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
    </asp:ListView>

</asp:Content>
