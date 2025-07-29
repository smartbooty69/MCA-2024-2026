<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="Program14.MainForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Multi-Function Number Processor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow-lg">
            <div class="card-header bg-success text-white text-center">
                <h2 class="mb-0">Multi-Function Number Processor</h2>
            </div>
            <div class="card-body">
                <form id="form1" runat="server">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label for="<%= txtInput.ClientID %>" class="form-label">Enter a number or string:</label>
                            <asp:TextBox ID="txtInput" runat="server" CssClass="form-control" placeholder="e.g., 121, 5, madam"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Select Operation:</label>
                            <asp:RadioButtonList ID="rblOperations" runat="server" RepeatDirection="Horizontal" CssClass="form-check-inline">
                                <asp:ListItem Text="Check Palindrome" Value="Palindrome" CssClass="form-check-input me-1"></asp:ListItem>
                                <asp:ListItem Text="Generate Fibonacci Series" Value="Fibonacci" CssClass="form-check-input me-1"></asp:ListItem>
                                <asp:ListItem Text="Sum of Digits" Value="SumDigits" CssClass="form-check-input me-1"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                            <asp:Button ID="btnProcess" runat="server" Text="Process" OnClick="btnProcess_Click" CssClass="btn btn-success btn-lg w-100" />
                        </div>
                    </div>

                    <div class="card mt-4 border-info">
                        <div class="card-header bg-info text-white">
                            <h4 class="mb-0">Result</h4>
                        </div>
                        <div class="card-body">
                            <asp:Label ID="lblResult" runat="server" Text="" CssClass="text-dark"></asp:Label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>