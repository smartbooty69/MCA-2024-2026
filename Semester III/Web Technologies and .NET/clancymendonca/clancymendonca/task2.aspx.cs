using System;

namespace clancymendonca
{
    public partial class Task2 : System.Web.UI.Page
    {
        protected void btnCheck_Click(object sender, EventArgs e)
        {
            int number;
            if (int.TryParse(txtNumber.Text, out number))
            {
                if (number <= 1)
                {
                    lblResult.Text = number + " is not a prime number.";
                }
                else if (IsPrime(number))
                {
                    lblResult.Text = number + " is a prime number.";
                }
                else
                {
                    lblResult.Text = number + " is not a prime number.";
                }
            }
            else
            {
                lblResult.Text = "Please enter a valid integer.";
            }
        }

        private bool IsPrime(int n)
        {
            if (n <= 1) return false;
            if (n == 2) return true;
            if (n % 2 == 0) return false;
            for (int i = 3; i * i <= n; i += 2)
            {
                if (n % i == 0) return false;
            }
            return true;
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