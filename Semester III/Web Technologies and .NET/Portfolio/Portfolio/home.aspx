<%@ Page Title="Home" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Portfolio.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-content-bg">
        <div class="global-pattern-bg"></div>
        <main>
            <div class="hero-content" data-aos="fade-up">
                <div class="hero-left">
                    <div class="image-container">
                        <img src="Images/profile.jpg" alt="A black and white portrait of Clancy Mendonca" class="profile-pic" />
                    </div>
                    <div class="social-links">
                        <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" aria-label="GitHub"><i class="fab fa-github"></i></a>
                    </div>
                </div>
                <div class="hero-right">
                    <h1><span>Hello,</span><br />I'm Clancy Mendonca</h1>
                    <p>A motivated student interested in building modern web applications and solving real-world problems with technology.</p>
                    <div class="cta-buttons">
                        <a href="#" class="btn">RESUME</a>
                        <a href="#" class="btn">SCHEDULE A MEETING</a>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <div class="about-section" data-aos="fade-right">
        <div class="content-wrapper">
            <h1>About Me</h1>
            <p>I'm Clancy Mendonca, a passionate developer and lifelong learner. My journey in technology began with a curiosity for how things work and a drive to create solutions that make a difference. I enjoy building modern web applications and exploring the intersection of technology and real-world impact.</p>
            <p>With a background in software engineering and a love for creative problem-solving, I aim to contribute to projects that are both innovative and meaningful. I’m always eager to learn new skills and collaborate with others who share my enthusiasm for technology.</p>
            <div class="credentials">
                <a href="#">My Credentials</a>
                <span class="arrow-down"></span>
            </div>
        </div>
    </div>
    <!-- Education & Experiences Section -->
    <main class="education-page-content">
        <section class="main-heading-section">
            <h1>Education & Experiences</h1>
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
        <!-- Projects & Skills Section -->
        <main class="projects-page-content">
            <section class="main-heading-section">
                <h1>Projects & Skills</h1>
            </section>
            <section class="projects-grid">
                <div class="project-card" data-aos="fade-up">
                    <div class="project-card-content">
                        <p class="project-date">2024</p>
                        <h3 class="project-title">E-commerce Webshop with Admin Dashboard and CMS</h3>
                        <p class="project-tags">Next.js 14 | TypeScript | Payload CMS | Stripe</p>
                        <p class="project-description">Built an e-commerce webshop using Next.js 14, TypeScript, Payload CMS, and Stripe integration for payments. Developed admin dashboard for content management and user authentication, including login and password recovery.</p>
                    </div>
                    <div class="project-card-bottom bottom-light-blue">
                        <a href="#" class="github-button">View on Github</a>
                    </div>
                </div>
                <div class="project-card" data-aos="fade-up">
                    <div class="project-card-content">
                        <p class="project-date">2024</p>
                        <h3 class="project-title">Animated Portfolio Website</h3>
                        <p class="project-tags">Next.js | Three.js | GSAP | Tailwind CSS | TypeScript | Prismic | Vercel</p>
                        <p class="project-description">Created a dynamic portfolio using Next.js, Three.js, GSAP, Tailwind CSS, and TypeScript. Integrated Prismic as a headless CMS and deployed with Vercel for seamless content management and updates.</p>
                    </div>
                    <div class="project-card-bottom bottom-purple">
                        <a href="#" class="github-button">View on Github</a>
                    </div>
                </div>
                <div class="project-card" data-aos="fade-up">
                    <div class="project-card-content">
                        <p class="project-date">2023</p>
                        <h3 class="project-title">Horizon Gymnasium - Gym Management System (Freelancing)</h3>
                        <p class="project-tags">HTML | CSS | JavaScript | Bootstrap | Ajax | PHP | MySQL</p>
                        <p class="project-description">Developed a Gym Management System with HTML, CSS, JavaScript, Bootstrap, Ajax, PHP, and MySQL. Developed frontend components and collaborated with backend team for integration, managing SEO, hosting, and design.</p>
                    </div>
                    <div class="project-card-bottom bottom-light-blue">
                        <a href="#" class="github-button">View on Github</a>
                    </div>
                </div>
                <div class="project-card" data-aos="fade-up">
                    <div class="project-card-content">
                        <p class="project-date">2023</p>
                        <h3 class="project-title">Foundrly - Startup Discovery & Community Interaction Platform</h3>
                        <p class="project-tags">Next.js | TypeScript | Sanity | Stream Chat | GitHub OAuth | Vercel | Sentry</p>
                        <p class="project-description">Built a full-stack platform with Next.js, TypeScript, Sanity, and Stream Chat for a startup showcasing and real-time interaction. Implemented GitHub OAuth, markdown posts, threaded comments, and deployed on Vercel with Sentry monitoring.</p>
                    </div>
                    <div class="project-card-bottom bottom-purple">
                        <a href="#" class="github-button">View on Github</a>
                    </div>
                </div>
                <div class="project-card" data-aos="fade-up">
                    <div class="project-card-content">
                        <p class="project-date">2024</p>
                        <h3 class="project-title">Dailypay - Banking App with Finance Management Dashboard</h3>
                        <p class="project-tags">Next.js 15 | Appwrite | Sentry | Plaid | Dwolla</p>
                        <p class="project-description">Developed using Next.js 15, featuring real-time transactions, multiple bank account connections, and secure user transfers. Integrated Appwrite for backend functionality, Sentry for monitoring, and Plaid and Dwolla for banking and payments.</p>
                    </div>
                    <div class="project-card-bottom bottom-light-blue">
                        <a href="#" class="github-button">View on Github</a>
                    </div>
                </div>
                <div class="project-card" data-aos="fade-up">
                    <div class="project-card-content">
                        <p class="project-date">2023</p>
                        <h3 class="project-title">Daily Quote App (Internship)</h3>
                        <p class="project-tags">Flutter | Backend Integration</p>
                        <p class="project-description">Developed a quotes app with Flutter, featuring options to save, copy, and share quotes. Collaborated with a Flutter developer to integrate backend services and ensure seamless functionality.</p>
                    </div>
                    <div class="project-card-bottom bottom-purple">
                        <a href="#" class="github-button">View on Github</a>
                    </div>
                </div>
                <div class="project-card" data-aos="fade-up">
                    <div class="project-card-content">
                        <p class="project-date">2023</p>
                        <h3 class="project-title">Ooty Baker & Confectioner – E-commerce CMS (Freelancing)</h3>
                        <p class="project-tags">PHP | MySQL | PHPMailer | PhpSpreadsheet | Bootstrap | SEO | Security</p>
                        <p class="project-description">Built a E-commerce CMS site using PHP and MySQL with admin dashboard, OTP login, and product and inquiry management. Integrated PHPMailer for emails, PhpSpreadsheet for exports, and implemented responsive UI with SEO and security features.</p>
                    </div>
                    <div class="project-card-bottom bottom-light-blue">
                        <a href="#" class="github-button">View on Github</a>
                    </div>
                </div>
            </section>
        </main>
        <!-- Technical Skills Section -->
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
    </main>
</asp:Content>

