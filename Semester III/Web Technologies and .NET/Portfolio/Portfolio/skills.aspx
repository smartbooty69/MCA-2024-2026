<%@ Page Title="Skills" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Skills.aspx.cs" Inherits="Portfolio.Skills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center fw-bold mb-4">My Skills</h2>

        <div class="row">
            <div class="col-md-6">
                <h4>Frontend</h4>
                <ul class="list-group mb-4">
                    <li class="list-group-item">HTML5</li>
                    <li class="list-group-item">CSS3 / SCSS</li>
                    <li class="list-group-item">JavaScript / TypeScript</li>
                    <li class="list-group-item">React.js</li>
                    <li class="list-group-item">Bootstrap / Tailwind CSS</li>
                </ul>
            </div>

            <div class="col-md-6">
                <h4>Backend & Tools</h4>
                <ul class="list-group mb-4">
                    <li class="list-group-item">C# / ASP.NET</li>
                    <li class="list-group-item">Node.js / Express</li>
                    <li class="list-group-item">MySQL / SQL Server</li>
                    <li class="list-group-item">Git / GitHub</li>
                    <li class="list-group-item">Visual Studio / VS Code</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
