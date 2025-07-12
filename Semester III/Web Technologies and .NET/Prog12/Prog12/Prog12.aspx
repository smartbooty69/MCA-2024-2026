<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prog12.aspx.cs" Inherits="Prog12.Prog12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Simple Calculator</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:300px; margin:40px auto; padding:20px; border:1px solid #ccc; border-radius:8px;">
            <h2>Simple Calculator</h2>
            <asp:TextBox ID="txtNumber1" runat="server" Width="120px" placeholder="Number 1"></asp:TextBox>
            <br /><br />
            <asp:TextBox ID="txtNumber2" runat="server" Width="120px" placeholder="Number 2"></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
            <asp:Button ID="btnSubtract" runat="server" Text="Subtract" OnClick="btnSubtract_Click" />
            <asp:Button ID="btnMultiply" runat="server" Text="Multiply" OnClick="btnMultiply_Click" />
            <asp:Button ID="btnDivide" runat="server" Text="Divide" OnClick="btnDivide_Click" />
            <br /><br />
            <asp:Label ID="lblResult" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
        </div>
    </form>
</body>
</html>