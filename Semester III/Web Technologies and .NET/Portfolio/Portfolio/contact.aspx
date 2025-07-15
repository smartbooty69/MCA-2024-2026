<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Portfolio.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5 mb-5">
        <h2 class="text-center fw-bold mb-4">Get in Touch</h2>

        <div class="row">
            <div class="col-md-6 mb-4">
                <h5>Contact Info</h5>
                <p><strong>Email:</strong> you@example.com</p>
                <p><strong>Phone:</strong> +91-12345-67890</p>
                <p>
                    <strong>Socials:</strong><br />
                    <a href="https://github.com/yourusername" target="_blank"><i class="fab fa-github"></i> GitHub</a><br />
                    <a href="https://linkedin.com/in/yourusername" target="_blank"><i class="fab fa-linkedin"></i> LinkedIn</a>
                </p>
            </div>

            <div class="col-md-6">
                <h5>Contact Form</h5>
                <asp:Label ID="lblStatus" runat="server" CssClass="text-success"></asp:Label>
                <div class="mb-3">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Your Message"></asp:TextBox>
                </div>
                <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn btn-primary" OnClick="btnSend_Click" />
            </div>
        </div>
    </div>
</asp:Content>
