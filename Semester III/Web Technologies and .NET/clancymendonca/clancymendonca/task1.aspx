<%@ Page Title="Task 1" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="task1.aspx.cs" Inherits="clancymendonca.Task1" %>
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
    <main class="task1-page-content">
        <section class="main-heading-section" style="text-align:center; margin-top:40px;">
            <h1 style="color:#F7B801; font-size:2.5em; margin-bottom:20px;">Current Server Time</h1>
            <asp:Label ID="lblTime" runat="server" Font-Size="XX-Large" ForeColor="#2980b9" />
        </section>
    </main>
</asp:Content> 