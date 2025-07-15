using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSkills_Click(object sender, EventArgs e)
        {
            Response.Redirect("Skills.aspx");
        }

        protected void btnProjects_Click(object sender, EventArgs e)
        {
            Response.Redirect("Projects.aspx");
        }

        protected void btnContact_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }
    }
}