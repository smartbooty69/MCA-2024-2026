using System;
using System.Web.UI;

namespace Prog13
{
    public partial class Prog13 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text;

            if (username == "admin" && password == "password123")
            {
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Login successful!";
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }
}