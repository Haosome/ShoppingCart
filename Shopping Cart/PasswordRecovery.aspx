<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="Shopping_Cart.PasswordRecovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>   
    <form id="form1" runat="server">
    <div>
    <ShoppingCart:LoginHeadBar runat="server" ID="LoginHeadBar" />
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" MailDefinition-Subject="Your New Password Fo ShoppingCart"></asp:PasswordRecovery>
    </div>
    </form>
</body>
</html>
