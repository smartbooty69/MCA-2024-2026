<%@ Page Title="Experience" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="experience.aspx.cs" Inherits="clancymendonca.Experience" %>
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
            <h1>Experience</h1>
        </section>
        <section class="work-section" id="work-section">
            <h2>Experience</h2>
            <div class="work-entry-box" data-aos="zoom-in">
                <div class="work-image-container">
                    <img src="Images/freelance_logo.jpg" alt="Freelance Logo" class="work-company-image" />
                </div>
                <div class="work-details">
                    <p class="work-company">Freelance | Full Stack Web Development</p>
                    <p class="work-description">Built full-stack web apps for clients using PHP, MySQL, JS, and Bootstrap with admin panels.<br>
                    Handled UI, auth, email, export features, SEO, deployment, and direct client communication.</p>
                </div>
            </div>
            <div class="work-entry-box" data-aos="zoom-in">
                <div class="work-image-container">
                    <img src="Images/zephyr-logo.jpeg" alt="Zephyr Technologies Logo" class="work-company-image" />
                </div>
                <div class="work-details">
                    <p class="work-company">Zephyr Technologies | Flutter Development Intern</p>
                    <p class="work-date">Dec 2023 - Jan 2024</p>
                    <p class="work-description">Built a Flutter quotes app with categories, favorites, and save/copy/share features.<br>
                    Collaborated on backend integration for seamless functionality.</p>
                </div>
            </div>
        </section>
    </main>
</asp:Content> 