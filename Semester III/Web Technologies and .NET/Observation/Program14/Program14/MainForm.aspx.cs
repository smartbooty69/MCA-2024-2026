using System;
using System.Collections.Generic; // Make sure this is included for List<long>
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Program14 // Replace with your actual project namespace
{
    public partial class MainForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nothing specific needed here for these functionalities
        }

        protected void btnProcess_Click(object sender, EventArgs e)
        {
            // Clear previous result
            lblResult.Text = "";

            // Get user input
            string inputString = txtInput.Text.Trim(); // Trim whitespace
            if (string.IsNullOrEmpty(inputString))
            {
                lblResult.Text = "Please enter input in the textbox.";
                return;
            }

            // Determine selected operation
            string selectedOperation = rblOperations.SelectedValue;

            switch (selectedOperation)
            {
                case "SumDigits":
                    int sumNumber;
                    if (int.TryParse(inputString, out sumNumber))
                    {
                        int sum = NumberProcessor.GetSumOfDigits(sumNumber);
                        lblResult.Text = $"The sum of digits for {inputString} is: {sum}";
                    }
                    else
                    {
                        lblResult.Text = "Invalid input for Sum of Digits. Please enter a valid integer.";
                    }
                    break;

                case "Palindrome":
                    // For palindrome, we can check the input string directly
                    bool isPalindrome = NumberProcessor.IsPalindrome(inputString);
                    lblResult.Text = $"'{inputString}' is {(isPalindrome ? "" : "NOT ")}a palindrome.";
                    break;

                case "Fibonacci":
                    int fibTerms;
                    // For Fibonacci, the input is the number of terms
                    if (int.TryParse(inputString, out fibTerms))
                    {
                        if (fibTerms > 50) // Prevent excessively long series for display purposes
                        {
                            lblResult.Text = "Please enter a number of terms less than or equal to 50 for Fibonacci series.";
                            return;
                        }
                        if (fibTerms < 0)
                        {
                            lblResult.Text = "Number of terms for Fibonacci must be non-negative.";
                            return;
                        }

                        List<long> fibonacciSeries = NumberProcessor.GenerateFibonacciSeries(fibTerms);
                        if (fibonacciSeries.Count > 0)
                        {
                            lblResult.Text = $"Fibonacci Series (first {fibTerms} terms):<br />" + string.Join(", ", fibonacciSeries);
                        }
                        else
                        {
                            lblResult.Text = "No Fibonacci series generated for the given terms.";
                        }
                    }
                    else
                    {
                        lblResult.Text = "Invalid input for Fibonacci Series. Please enter a valid integer for the number of terms.";
                    }
                    break;

                default:
                    lblResult.Text = "Please select an operation.";
                    break;
            }
        }
    }
}