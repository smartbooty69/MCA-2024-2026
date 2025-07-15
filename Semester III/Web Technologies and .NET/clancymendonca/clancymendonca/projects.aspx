<%@ Page Title="Projects" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="projects.aspx.cs" Inherits="clancymendonca.Projects" %>
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
    <main class="projects-page-content">
        <section class="main-heading-section">
            <h1>Projects & Skills</h1>
        </section>
        <section class="projects-grid">
            <a href="https://github.com/smartbooty69/E-Commerce-Website" class="project-card" data-aos="fade-up" style="text-decoration:none;color:inherit;">
                <div class="project-card-content">
                    <p class="project-date">2024</p>
                    <h3 class="project-title">E-commerce Webshop with Admin Dashboard and CMS</h3>
                    <p class="project-tags">Next.js 14 | TypeScript | Payload CMS | Stripe</p>
                    <p class="project-description">Built an e-commerce webshop using Next.js 14, TypeScript, Payload CMS, and Stripe integration for payments. Developed admin dashboard for content management and user authentication, including login and password recovery.</p>
                </div>
            </a>
            <a href="https://clancymendonca.vercel.app" class="project-card" data-aos="fade-up" style="text-decoration:none;color:inherit;">
                <div class="project-card-content">
                    <p class="project-date">2024</p>
                    <h3 class="project-title">Animated Portfolio Website</h3>
                    <p class="project-tags">Next.js | Three.js | GSAP | Tailwind CSS | TypeScript | Prismic | Vercel</p>
                    <p class="project-description">Created a dynamic portfolio using Next.js, Three.js, GSAP, Tailwind CSS, and TypeScript. Integrated Prismic as a headless CMS and deployed with Vercel for seamless content management and updates.</p>
                </div>
            </a>
            <a href="https://github.com/smartbooty69/Horizon-Gym-Management-System" class="project-card" data-aos="fade-up" style="text-decoration:none;color:inherit;">
                <div class="project-card-content">
                    <p class="project-date">2023</p>
                    <h3 class="project-title">Horizon Gymnasium - Gym Management System (Freelancing)</h3>
                    <p class="project-tags">HTML | CSS | JavaScript | Bootstrap | Ajax | PHP | MySQL</p>
                    <p class="project-description">Developed a Gym Management System with HTML, CSS, JavaScript, Bootstrap, Ajax, PHP, and MySQL. Developed frontend components and collaborated with backend team for integration, managing SEO, hosting, and design.</p>
                </div>
            </a>
            <a href="https://foundrly.vercel.app" class="project-card" data-aos="fade-up" style="text-decoration:none;color:inherit;">
                <div class="project-card-content">
                    <p class="project-date">2023</p>
                    <h3 class="project-title">Foundrly - Startup Discovery & Community Interaction Platform</h3>
                    <p class="project-tags">Next.js | TypeScript | Sanity | Stream Chat | GitHub OAuth | Vercel | Sentry</p>
                    <p class="project-description">Built a full-stack platform with Next.js, TypeScript, Sanity, and Stream Chat for a startup showcasing and real-time interaction. Implemented GitHub OAuth, markdown posts, threaded comments, and deployed on Vercel with Sentry monitoring.</p>
                </div>
            </a>
            <a href="https://daily-pay.vercel.app" class="project-card" data-aos="fade-up" style="text-decoration:none;color:inherit;">
                <div class="project-card-content">
                    <p class="project-date">2024</p>
                    <h3 class="project-title">Dailypay - Banking App with Finance Management Dashboard</h3>
                    <p class="project-tags">Next.js 15 | Appwrite | Sentry | Plaid | Dwolla</p>
                    <p class="project-description">Developed using Next.js 15, featuring real-time transactions, multiple bank account connections, and secure user transfers. Integrated Appwrite for backend functionality, Sentry for monitoring, and Plaid and Dwolla for banking and payments.</p>
                </div>
            </a>
            <a href="https://github.com/smartbooty69/Daily_Quote" class="project-card" data-aos="fade-up" style="text-decoration:none;color:inherit;">
                <div class="project-card-content">
                    <p class="project-date">2023</p>
                    <h3 class="project-title">Daily Quote App (Internship)</h3>
                    <p class="project-tags">Flutter | Backend Integration</p>
                    <p class="project-description">Developed a quotes app with Flutter, featuring options to save, copy, and share quotes. Collaborated with a Flutter developer to integrate backend services and ensure seamless functionality.</p>
                </div>
            </a>
            <a href="https://github.com/smartbooty69/Ooty-Baker-and-Confectioner" class="project-card" data-aos="fade-up" style="text-decoration:none;color:inherit;">
                <div class="project-card-content">
                    <p class="project-date">2023</p>
                    <h3 class="project-title">Ooty Baker & Confectioner – E-commerce CMS (Freelancing)</h3>
                    <p class="project-tags">PHP | MySQL | PHPMailer | PhpSpreadsheet | Bootstrap | SEO | Security</p>
                    <p class="project-description">Built a E-commerce CMS site using PHP and MySQL with admin dashboard, OTP login, and product and inquiry management. Integrated PHPMailer for emails, PhpSpreadsheet for exports, and implemented responsive UI with SEO and security features.</p>
                </div>
            </a>
        </section>
    </main>
</asp:Content> 