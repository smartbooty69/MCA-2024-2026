package com.mad.prog03;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import java.util.Stack;

public class MainActivity extends AppCompatActivity {
    // UI Controls
    EditText postfix;
    Button evaluate;
    String exp;
    int result;

    // Method to evaluate value of a postfix expression
    static int evaluatePostfix(String exp) {
        // Create a stack to evaluate the expression
        Stack<Integer> stack = new Stack<>();
        String[] tokens = exp.split(" ");  // Split the expression by spaces

        for (String token : tokens) {
            if (token.isEmpty()) continue;  // Skip any empty tokens

            if (isNumeric(token)) {
                // If the token is a number, push it to the stack
                stack.push(Integer.parseInt(token));
            } else {
                // Otherwise, it's an operator, pop two numbers and apply the operator
                int val1 = stack.pop();
                int val2 = stack.pop();

                switch (token) {
                    case "+":
                        stack.push(val2 + val1);
                        break;
                    case "-":
                        stack.push(val2 - val1);
                        break;
                    case "*":
                        stack.push(val2 * val1);
                        break;
                    case "/":
                        if (val1 != 0) {
                            stack.push(val2 / val1);
                        } else {
                            // Handle division by zero
                            return Integer.MIN_VALUE;  // Return an error value
                        }
                        break;
                }
            }
        }
        return stack.pop();  // The result is the last element in the stack
    }

    // Helper method to check if a string is numeric
    static boolean isNumeric(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialize UI Controls
        postfix = findViewById(R.id.txtPostFix);
        evaluate = findViewById(R.id.btnEvaluate);

        evaluate.setOnClickListener(v -> {
            // Get the input expression
            exp = postfix.getText().toString().trim();

            // Evaluate the postfix expression
            result = evaluatePostfix(exp);

            if (result == Integer.MIN_VALUE) {
                // Show error if the expression is invalid or division by zero occurred
                Toast.makeText(getApplicationContext(), "Error in expression (possibly division by zero)", Toast.LENGTH_SHORT).show();
            } else {
                // Show the result
                Toast.makeText(getApplicationContext(), "Evaluation of Postfix Expression: " + exp + " = " + result, Toast.LENGTH_SHORT).show();
            }
        });
    }
}