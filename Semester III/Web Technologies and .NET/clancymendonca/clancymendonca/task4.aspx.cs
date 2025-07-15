using System;

namespace clancymendonca
{
    public partial class Task4 : System.Web.UI.Page
    {
        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            double num1, num2 = 0, result = 0; // Initialize num2 to 0
            bool valid = double.TryParse(txtNum1.Text, out num1) && double.TryParse(txtNum2.Text, out num2);
            if (!valid)
            {
                lblResult.Text = "Please enter valid numbers.";
                return;
            }
            string op = ddlOperation.SelectedValue;
            switch (op)
            {
                case "add":
                    result = num1 + num2;
                    lblResult.Text = $"{num1} + {num2} = {result}";
                    break;
                case "subtract":
                    result = num1 - num2;
                    lblResult.Text = $"{num1} - {num2} = {result}";
                    break;
                case "multiply":
                    result = num1 * num2;
                    lblResult.Text = $"{num1} × {num2} = {result}";
                    break;
                case "divide":
                    if (num2 == 0)
                        lblResult.Text = "Cannot divide by zero.";
                    else
                    {
                        result = num1 / num2;
                        lblResult.Text = $"{num1} ÷ {num2} = {result}";
                    }
                    break;
            }
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