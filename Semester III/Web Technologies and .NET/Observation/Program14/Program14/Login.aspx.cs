using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; // Required for TextBox, Button, Label

namespace Program14 // IMPORTANT: Replace with your actual project namespace!
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This method runs when the page is loaded.
            // For a login page, you might clear previous messages or focus a textbox.
            if (!IsPostBack) // Only execute on the first load, not on postbacks (like button clicks)
            {
                lblMessage.Text = ""; // Clear any previous messages
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get username and password from the textboxes
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // --- Basic Hardcoded Validation (For Demonstration Only) ---
            // In a real application, you would:
            // 1. Hash passwords (NEVER store plain text passwords).
            // 2. Query a database or use an authentication service (e.g., ASP.NET Identity, Active Directory).
            const string ValidUsername = "user";
            const string ValidPassword = "password123"; // This would be a hashed value in production

            if (username == ValidUsername && password == ValidPassword)
            {
                // Successful login
                lblMessage.Text = "Login Successful!";
                lblMessage.CssClass = "success-message"; // Change style to green

                // Redirect to the main application page (e.g., MainForm.aspx)
                // Important: Server.Transfer keeps the URL in the browser the same, but transfers control.
                // Response.Redirect sends a new request to the browser, changing the URL.
                // For a post-login redirect, Response.Redirect is typically preferred.
                Response.Redirect("MainForm.aspx", false); // The 'false' prevents a ThreadAbortException
                                                           // and is generally good practice when calling Response.Redirect.
            }
            else
            {
                // Failed login
                lblMessage.Text = "Invalid Username or Password.";
                lblMessage.CssClass = "error-message"; // Ensure it's red
            }
        }
    }
}