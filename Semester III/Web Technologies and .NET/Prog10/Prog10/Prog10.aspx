<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prog10.aspx.cs" Inherits="Prog10.Prog10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtName" runat="server" />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <br /><br />
            <asp:Label ID="lblWelcome" runat="server" />
        </div>
    </form>
</body>
</html>