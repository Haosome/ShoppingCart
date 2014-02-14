<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Account.Master" AutoEventWireup="true" CodeBehind="SellAnItem.aspx.cs" Inherits="Shopping_Cart.Account.SellAnItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <asp:EntityDataSource ID="CategoryEntityDataSource" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableFlattening="False" EntitySetName="Categories" Select="it.[CategoryID], it.[CategoryName]">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="ProductEntityDataSource" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableFlattening="False" EnableInsert="True" EntitySetName="Products">
    </asp:EntityDataSource>
    Category: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="CategoryEntityDataSource" DataTextField="CategoryName" DataValueField="CategoryID">
    </asp:DropDownList>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ProductID" DataSourceID="ProductEntityDataSource" Height="50px" Width="125px" DefaultMode="Insert" OnItemInserting="DetailsView1_ItemInserting" Style="margin-top: 0px">
        <Fields>
            <asp:TemplateField HeaderText="ProductName" SortExpression="ProductName">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Upload an image" SortExpression="ImagePath">
                <InsertItemTemplate>
                    <asp:FileUpload ID="ImageUpload" runat="server" />
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price" SortExpression="Price">
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
