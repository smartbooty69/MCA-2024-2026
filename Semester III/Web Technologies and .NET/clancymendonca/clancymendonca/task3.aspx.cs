using System;

namespace clancymendonca
{
    public partial class Task3 : System.Web.UI.Page
    {
        protected void btnCheck_Click(object sender, EventArgs e)
        {
            int year;
            if (int.TryParse(txtYear.Text, out year))
            {
                if (IsLeapYear(year))
                {
                    lblResult.Text = year + " is a leap year.";
                }
                else
                {
                    lblResult.Text = year + " is not a leap year.";
                }
            }
            else
            {
                lblResult.Text = "Please enter a valid year.";
            }
        }

        private bool IsLeapYear(int year)
        {
            return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
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
        protected void lnkEducation_Click(object sender, EventArgs e)
        {
            Response.Redirect("education.aspx");
        }
        protected void lnkExperience_Click(object sender, EventArgs e)
        {
            Response.Redirect("experience.aspx");
        }
    }
} 