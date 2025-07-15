<%@ Page Title="Task 2" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="task2.aspx.cs" Inherits="clancymendonca.Task2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <nav>
        <ul>
            <li><asp:LinkButton runat="server" ID="lnkHome" OnClick="lnkHome_Click">Home</asp:LinkButton></li>
            <li><asp:LinkButton runat="server" ID="lnkSkills" OnClick="lnkSkills_Click">Skills</asp:LinkButton></li>
            <li><asp:LinkButton runat="server" ID="lnkProjects" OnClick="lnkProjects_Click">Projects</asp:LinkButton></li>
            <li><asp:LinkButton runat="server" ID="lnkEducation" OnClick="lnkEducation_Click">Education</asp:LinkButton></li>
            <li><asp:LinkButton runat="server" ID="lnkExperience" OnClick="lnkExperience_Click">Experience</asp:LinkButton></li>
        </ul>
    </nav>
    <main class="task2-page-content">
        <section class="main-heading-section" style="text-align:center; margin-top:60px; padding:40px 0;">
            <h1 style="color:#F7B801; font-size:2.5em; margin-bottom:32px;">Prime Number Checker</h1>
            <span style="display:inline-flex; align-items:center; gap:32px;">
                <asp:Label ID="lblPrompt" runat="server" Text="Enter a number:" style="font-size:1.2em;" />
                <asp:TextBox ID="txtNumber" runat="server" style="font-size:1.2em; width:140px; padding:10px; border-radius:7px; border:1px solid #ccc;" />
                <asp:Button ID="btnCheck" runat="server" Text="Check" OnClick="btnCheck_Click" style="font-size:1.1em; background-color:#27ae60; color:white; border:none; border-radius:7px; padding:10px 28px; cursor:pointer; margin-bottom:10px;" />
            </span>
            <br /><br />
            <asp:Label ID="lblResult" runat="server" Font-Size="X-Large" style="display:block; margin-top:24px; color:#2980b9; padding:10px 0;" />
        </section>
    </main>
</asp:Content> 