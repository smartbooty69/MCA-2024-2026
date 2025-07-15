using System;

namespace clancymendonca
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
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
        protected void lnkContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("contact.aspx");
        }
    }
} 