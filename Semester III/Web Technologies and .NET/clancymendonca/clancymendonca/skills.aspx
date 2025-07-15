<%@ Page Title="Skills" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="skills.aspx.cs" Inherits="clancymendonca.Skills" %>
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
    <main class="skills-page-content">
        <section class="skills-section" data-aos="zoom-in">
            <h1 class="skills-heading">Technical Skills</h1>
            <div class="skills-grid">
                <i class="devicon-html5-plain colored skill-icon" title="HTML5" data-aos="zoom-in"></i>
                <i class="devicon-css3-plain colored skill-icon" title="CSS3" data-aos="zoom-in"></i>
                <i class="devicon-javascript-plain colored skill-icon" title="JavaScript" data-aos="zoom-in"></i>
                <i class="devicon-typescript-plain colored skill-icon" title="TypeScript" data-aos="zoom-in"></i>
                <i class="devicon-php-plain colored skill-icon" title="PHP" data-aos="zoom-in"></i>
                <i class="devicon-python-plain colored skill-icon" title="Python" data-aos="zoom-in"></i>
                <i class="devicon-java-plain colored skill-icon" title="Java" data-aos="zoom-in"></i>
                <i class="devicon-dart-plain colored skill-icon" title="Dart" data-aos="zoom-in"></i>
                <i class="devicon-react-original colored skill-icon" title="React.js" data-aos="zoom-in"></i>
                <i class="devicon-tailwindcss-plain colored skill-icon" title="Tailwind CSS" data-aos="zoom-in"></i>
                <i class="devicon-git-plain colored skill-icon" title="Git" data-aos="zoom-in"></i>
                <i class="devicon-github-original colored skill-icon" title="GitHub" data-aos="zoom-in"></i>
                <i class="devicon-nodejs-plain colored skill-icon" title="Node.js" data-aos="zoom-in"></i>
                <i class="devicon-express-original colored skill-icon" title="Express.js" data-aos="zoom-in"></i>
                <i class="devicon-flutter-plain colored skill-icon" title="Flutter" data-aos="zoom-in"></i>
                <i class="devicon-mysql-plain colored skill-icon" title="MySQL" data-aos="zoom-in"></i>
                <i class="devicon-mongodb-plain colored skill-icon" title="MongoDB" data-aos="zoom-in"></i>
                <i class="devicon-postgresql-plain colored skill-icon" title="PostgreSQL" data-aos="zoom-in"></i>
            </div>
        </section>
    </main>
</asp:Content> 