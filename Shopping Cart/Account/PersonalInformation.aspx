<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Account.Master" AutoEventWireup="true" CodeBehind="PersonalInformation.aspx.cs" Inherits="Shopping_Cart.Account.PersonalInformation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ShoppingCartEntities" DefaultContainerName="ShoppingCartEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="MyProfiles"></asp:EntityDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="UserID" DataSourceID="EntityDataSource1" Height="50px" Width="125px" OnItemUpdating="DetailsView1_ItemUpdating">
                <Fields>
                    <asp:TemplateField HeaderText="First Name" SortExpression="FirstName">
                        <EditItemTemplate>
                            <asp:TextBox ID="FirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Your First Name" ControlToValidate="FirstName" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                        <EditItemTemplate>
                            <asp:TextBox ID="LastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Your Last Name" ControlToValidate="LastName" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Of Birth" SortExpression="DateOfBirth">
                        <EditItemTemplate>
                            <asp:TextBox ID="DateOfBirth" runat="server" Text='<%# Eval("DateOfBirth","{0:dd/MM/yyyy}")%>'></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="DateOfBirth" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Your Brithday" ControlToValidate="DateOfBirth" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DateOfBirth","{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact Address" SortExpression="ContactAddress">
                        <EditItemTemplate>
                            <asp:TextBox ID="ContactAddress" runat="server" Text='<%# Bind("ContactAddress") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Your Contact Address" ControlToValidate="ContactAddress" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("ContactAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact PostalCode" SortExpression="ContactPostalCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="ContactPostalCode" runat="server" Text='<%# Bind("ContactPostalCode") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Your Contact PostalCode" ControlToValidate="ContactPostalCode" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ContactPostalCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact PhoneNumber" SortExpression="ContactPhoneNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="ContactPhoneNumber" runat="server" Text='<%# Bind("ContactPhoneNumber") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Your Contact PhoneNumber" ControlToValidate="ContactPhoneNumber" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ContactPhoneNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipping Address" SortExpression="ShippingAddress">
                        <EditItemTemplate>
                            <asp:CheckBox ID="SameAsContactAddress" runat="server" Text="Same As Contact Address" AutoPostBack="True" OnCheckedChanged="SameAsContactAddress_CheckedChanged"/>
                            <asp:TextBox ID="ShippingAddress" runat="server" Text='<%# Bind("ShippingAddress") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Your Shipping Address" ControlToValidate="ShippingAddress" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("ShippingAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipping PostalCode" SortExpression="ShippingPostalCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="ShippingPostalCode" runat="server" Text='<%# Bind("ShippingPostalCode") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Enter Your Shipping PostalCode" ControlToValidate="ShippingPostalCode" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("ShippingPostalCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shipping PhoneNumber" SortExpression="ShippingPhoneNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="ShippingPhoneNumber" runat="server" Text='<%# Bind("ShippingPhoneNumber") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please Enter Your Shipping PhoneNumber" ControlToValidate="ShippingPhoneNumber" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("ShippingPhoneNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
