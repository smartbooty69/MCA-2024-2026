﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prog11.aspx.cs" Inherits="Prog11.Prog11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Initial text"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Click Me" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>