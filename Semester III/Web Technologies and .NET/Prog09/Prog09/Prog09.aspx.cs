using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Prog09
{
    public partial class Prog09 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblServerDateTime.Text = "Server Date and Time: " + DateTime.Now.ToString("F");
            }
        }
    }
}