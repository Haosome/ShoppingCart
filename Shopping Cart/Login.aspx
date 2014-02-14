<%@ Page Title="Login" Language="C#" MasterPageFile="~/Masterpages/Account.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Shopping_Cart.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:LoginView ID="LoginView1" runat="server">
        <AnonymousTemplate>
            <div class="Login">
            <table>
                <tr>
                    <td>
                        <asp:Login ID="Login" runat="server">
                        </asp:Login>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/PasswordRecovery.aspx">Forget your password?</asp:HyperLink></td>
                </tr>
            </table>
            </div>

            <asp:CreateUserWizard ID="CreateUserWizard" runat="server" CssClass="CreateUserWizard">
                <MailDefinition BodyFileName="~/App_Data/SignUpConfirmation.txt" Subject="Your New Account At ShoppingCart">
                </MailDefinition>
                <WizardSteps>
                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    </asp:CreateUserWizardStep>
                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    </asp:CompleteWizardStep>
                </WizardSteps>
            </asp:CreateUserWizard>
        </AnonymousTemplate>
        <LoggedInTemplate>
            You are already logged in.
        </LoggedInTemplate>
    </asp:LoginView>


</asp:Content>
