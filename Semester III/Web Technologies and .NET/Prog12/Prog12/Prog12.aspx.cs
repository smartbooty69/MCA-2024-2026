using System;
using System.Web.UI;

namespace Prog12
{
    public partial class Prog12 : Page
    {
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            double num1, num2;
            if (TryGetNumbers(out num1, out num2))
                lblResult.Text = $"Result: {num1 + num2}";
        }

        protected void btnSubtract_Click(object sender, EventArgs e)
        {
            double num1, num2;
            if (TryGetNumbers(out num1, out num2))
                lblResult.Text = $"Result: {num1 - num2}";
        }

        protected void btnMultiply_Click(object sender, EventArgs e)
        {
            double num1, num2;
            if (TryGetNumbers(out num1, out num2))
                lblResult.Text = $"Result: {num1 * num2}";
        }

        protected void btnDivide_Click(object sender, EventArgs e)
        {
            double num1, num2;
            if (TryGetNumbers(out num1, out num2))
            {
                if (num2 == 0)
                    lblResult.Text = "Error: Division by zero!";
                else
                    lblResult.Text = $"Result: {num1 / num2}";
            }
        }

        private bool TryGetNumbers(out double num1, out double num2)
        {
            bool valid1 = double.TryParse(txtNumber1.Text, out num1);
            bool valid2 = double.TryParse(txtNumber2.Text, out num2);

            if (!valid1 || !valid2)
            {
                lblResult.Text = "Please enter valid numbers.";
                return false;
            }
            return true;
        }
    }
}