using System;
using System.Web.UI;

namespace clancymendonca
{
    public partial class Home : Page
    {
        protected void lnkHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
        protected void lnkSkills_Click(object sender, EventArgs e)
        {
            Response.Redirect("skills.aspx");
        }
        protected void lnkProjects_Click(object sender, EventArgs e)
        {
            Response.Redirect("projects.aspx");
        }
        protected void lnkEducation_Click(object sender, EventArgs e)
        {
            Response.Redirect("education.aspx");
        }
        protected void lnkExperience_Click(object sender, EventArgs e)
        {
            Response.Redirect("experience.aspx");
        }
        protected void lnkTask1_Click(object sender, EventArgs e)
        {
            Response.Redirect("task1.aspx");
        }
        protected void lnkTask2_Click(object sender, EventArgs e)
        {
            Response.Redirect("task2.aspx");
        }
        protected void lnkTask3_Click(object sender, EventArgs e)
        {
            Response.Redirect("task3.aspx");
        }
        protected void lnkTask4_Click(object sender, EventArgs e)
        {
            Response.Redirect("task4.aspx");
        }
    }
}