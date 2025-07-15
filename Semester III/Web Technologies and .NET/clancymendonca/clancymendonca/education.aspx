<%@ Page Title="Education" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="education.aspx.cs" Inherits="clancymendonca.Education" %>
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
    <main class="education-page-content">
        <section class="main-heading-section">
            <h1>Education</h1>
        </section>
        <section class="education-section" id="education-section">
            <h2>Education</h2>
            <div class="education-entry-box" data-aos="zoom-in">
                <div class="education-image-container">
                    <img src="Images/gurukula-logo.png" alt="Gurukula PU College Logo" class="education-building-image" />
                </div>
                <div class="education-details">
                    <p class="education-date">2019 - 2021</p>
                    <p class="education-institution">GURUKULA PU COLLEGE</p>
                    <p class="education-degree">Commerce : CSBA</p>
                </div>
            </div>
            <div class="education-entry-box" data-aos="zoom-in">
                <div class="education-image-container">
                    <img src="Images/aloysius-logo.png" alt="St Aloysius College Logo" class="education-building-image" />
                </div>
                <div class="education-details">
                    <p class="education-date">2021 - 2024</p>
                    <p class="education-institution">ST ALOYSIUS COLLEGE</p>
                    <p class="education-degree">Bachelor of Computer Applications</p>
                </div>
            </div>
            <div class="education-entry-box" data-aos="zoom-in">
                <div class="education-image-container">
                    <img src="Images/joseph-logo.jpeg" alt="St Joseph's University Logo" class="education-building-image" />
                </div>
                <div class="education-details">
                    <p class="education-date">2024 - 2026</p>
                    <p class="education-institution">ST JOSEPH'S UNIVERSITY</p>
                    <p class="education-degree">Master of Computer Applications</p>
                </div>
            </div>
        </section>
    </main>
</asp:Content> 