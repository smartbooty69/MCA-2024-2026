<%@ Page Title="Projects" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="Portfolio.Projects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2 class="text-center fw-bold mb-5">Projects</h2>

        <div class="row row-cols-1 row-cols-md-3 g-4">

            <!-- Project 1 -->
            <div class="col">
                <div class="card h-100">
                    <img src="Images/project1.jpg" class="card-img-top" alt="Project 1 Screenshot">
                    <div class="card-body">
                        <h5 class="card-title">Personal Portfolio</h5>
                        <p class="card-text">A modern responsive portfolio built using HTML, CSS, and JavaScript, deployed on GitHub Pages.</p>
                    </div>
                    <div class="card-footer">
                        <a href="https://github.com/yourusername/portfolio" target="_blank" class="btn btn-sm btn-primary">View Code</a>
                    </div>
                </div>
            </div>

            <!-- Project 2 -->
            <div class="col">
                <div class="card h-100">
                    <img src="Images/project2.jpg" class="card-img-top" alt="Project 2 Screenshot">
                    <div class="card-body">
                        <h5 class="card-title">E-Commerce Web App</h5>
                        <p class="card-text">An ASP.NET + MySQL based bakery storefront with admin dashboard, PHPMailer and Excel integration.</p>
                    </div>
                    <div class="card-footer">
                        <a href="https://github.com/yourusername/ecommerce" target="_blank" class="btn btn-sm btn-primary">View Code</a>
                    </div>
                </div>
            </div>

            <!-- Project 3 -->
            <div class="col">
                <div class="card h-100">
                    <img src="Images/project3.jpg" class="card-img-top" alt="Project 3 Screenshot">
                    <div class="card-body">
                        <h5 class="card-title">Greenhouse IoT</h5>
                        <p class="card-text">A full-stack greenhouse monitoring system using sensors, PHP dashboard, and real-time alerting system.</p>
                    </div>
                    <div class="card-footer">
                        <a href="https://github.com/yourusername/greenhouse" target="_blank" class="btn btn-sm btn-primary">View Code</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
